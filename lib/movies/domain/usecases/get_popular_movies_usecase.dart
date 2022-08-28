import 'package:dartz/dartz.dart';
import 'package:movies_application/movies/domain/entities/movies.dart';
import 'package:movies_application/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class GetPopularMoviesUseCase {
  BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
