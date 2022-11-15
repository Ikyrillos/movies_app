import 'package:get_it/get_it.dart';
import 'package:movies_application/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies_application/movies/data/repository/moveis_repository.dart';
import 'package:movies_application/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_application/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_application/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_application/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_application/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:movies_application/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_application/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies_application/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static init() {
    // Bloc
    sl.registerFactory(() => MoviesBloc(
        getNowPlayingUseCase: sl(),
        getPopularMoviesUseCase: sl(),
        getTopRatedMoviesUseCase: sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    // Remote Data Source
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MoviesRemoteDataSource());

    // repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(moviesRemoteDataSource: sl()));

    //use case
    sl.registerLazySingleton<GetNowPlayingUseCase>(
        () => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton<GetPopularMoviesUseCase>(
        () => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton<GetTopRatedMoviesUseCase>(
        () => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton<GetMovieDetailUseCase>(
        () => GetMovieDetailUseCase(baseMoviesRepository: sl()));
    sl.registerLazySingleton<GetRecommendationUseCase>(
        () => GetRecommendationUseCase(sl()));
  }
}
