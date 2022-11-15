import 'package:dartz/dartz.dart';
import 'package:movies_application/movies/data/models/recommendation_model.dart';
import 'package:movies_application/movies/domain/entities/movie_details.dart';
import 'package:movies_application/movies/domain/entities/movies.dart';
import 'package:movies_application/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_application/movies/domain/usecases/get_recommendation_usecase.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParams movieDetailsParams);
  Future<Either<Failure, List<RecommendationModel>>> getRecommendations(
      MovieRecommendationParams movieRecommendationParams);
}
