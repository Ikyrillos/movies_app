import 'package:dartz/dartz.dart';
import 'package:movies_application/core/usecases/base_usecase.dart';
import 'package:movies_application/movies/domain/entities/movies.dart';
import 'package:movies_application/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>,EmptyParameter> {
  BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(EmptyParameter parameter) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
