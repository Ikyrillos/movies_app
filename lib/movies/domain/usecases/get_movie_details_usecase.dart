import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movies_application/core/error/failure.dart';
import 'package:movies_application/core/usecases/base_usecase.dart';
import 'package:movies_application/movies/domain/entities/movie_details.dart';
import 'package:movies_application/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParams> {
  BaseMoviesRepository baseMoviesRepository;
  GetMovieDetailUseCase({
    required this.baseMoviesRepository,
  });
  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParams parameter) async {
    return await baseMoviesRepository.getMovieDetails(parameter);
  }
}

class MovieDetailsParams extends Equatable {
  final int id;

  const MovieDetailsParams(this.id);

  @override
  List<Object> get props => [id];
}
