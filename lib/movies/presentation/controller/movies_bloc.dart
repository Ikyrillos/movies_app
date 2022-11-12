import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_application/core/utils/enums.dart';
import 'package:movies_application/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_application/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_application/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_application/movies/presentation/controller/movies_events.dart';
import 'package:movies_application/movies/presentation/controller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  GetNowPlayingUseCase getNowPlayingUseCase;
  GetPopularMoviesUseCase getPopularMoviesUseCase;
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc({
    required this.getNowPlayingUseCase,
    required this.getPopularMoviesUseCase,
    required this.getTopRatedMoviesUseCase,
  }) : super(const MoviesState()) {
    on<GetNowPlayingEvent>(_getNowPlaying);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlaying(event, emit) async {
    var result = await getNowPlayingUseCase();
    result.fold(
        (l) => {
              emit(state.copyWith(
                  nowPlayingState: RequestStates.error,
                  nowPlayingMessage: l.message))
            },
        (r) => {
              emit(state.copyWith(
                  nowPlayingState: RequestStates.loaded, nowPlayingMovies: r))
            });
    // print(result);
  }

  FutureOr<void> _getPopularMovies(event, emit) async {
    var result = await getPopularMoviesUseCase();
    result.fold(
        (l) => {
              emit(state.copyWith(
                  popularMoviesState: RequestStates.error,
                  popularMoviesMessage: l.message))
            },
        (r) => {
              emit(state.copyWith(
                  popularMoviesState: RequestStates.loaded, popularMovies: r))
            });
    // print(result);
  }

  FutureOr<void> _getTopRatedMovies(event, emit) async {
    var result = await getTopRatedMoviesUseCase();
    result.fold(
        (l) => {
              emit(state.copyWith(
                  topRatedMoviesState: RequestStates.error,
                  topRatedMoviesMessage: l.message))
            },
        (r) => {
              emit(state.copyWith(
                  topRatedMoviesState: RequestStates.loaded, topRatedMovies: r))
            });
    // print(result);
  }
}
