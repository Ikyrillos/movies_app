import 'package:dartz/dartz.dart';
import 'package:movies_application/core/error/failure.dart';
import 'package:movies_application/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies_application/movies/domain/entities/movies.dart';

import '../../../core/error/exceptions.dart';
import '../../domain/repository/base_movies_repository.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource moviesRemoteDataSource;

  MoviesRepository({
    required this.moviesRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await moviesRemoteDataSource.getNowPlayingMovies();
    print(result);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await moviesRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await moviesRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
