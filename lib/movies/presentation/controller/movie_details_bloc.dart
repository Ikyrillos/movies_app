import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_application/core/utils/enums.dart';
import 'package:movies_application/movies/data/models/recommendation_model.dart';
import 'package:movies_application/movies/domain/entities/movie_details.dart';
import 'package:movies_application/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_application/movies/domain/usecases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getRecommendations);
  }

  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;
  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailUseCase(MovieDetailsParams(event.movieId));
    result.fold(
      (l) {
        emit(state.copyWith(
            message: l.message, requestState: RequestStates.error));
      },
      (r) {
        emit(
            state.copyWith(movieDetail: r, requestState: RequestStates.loaded));
      },
    );
  }

  FutureOr<void> _getRecommendations(GetMovieRecommendationsEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUseCase(
        MovieRecommendationParams(id: event.movieId));
    result.fold(
      (l) {
        emit(state.copyWith(
            message: l.message, recommendationState: RequestStates.error));
      },
      (r) {
        emit(state.copyWith(
            recommendationModel: r, recommendationState: RequestStates.loaded));
      },
    );
  }
}
