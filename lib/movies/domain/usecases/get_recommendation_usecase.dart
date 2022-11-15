import 'package:dartz/dartz.dart';
import 'package:movies_application/core/error/failure.dart';
import 'package:movies_application/core/usecases/base_usecase.dart';
import 'package:movies_application/movies/data/models/recommendation_model.dart';
import 'package:movies_application/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<RecommendationModel>, MovieRecommendationParams> {
  BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<RecommendationModel>>> call(
      MovieRecommendationParams parameter) async {
    return await baseMoviesRepository.getRecommendations(parameter);
  }
}

class MovieRecommendationParams {
  final int id;

  MovieRecommendationParams({
    required this.id,
  });
}
