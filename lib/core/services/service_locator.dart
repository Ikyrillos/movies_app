import 'package:get_it/get_it.dart';
import 'package:movies_application/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies_application/movies/data/repository/moveis_repository.dart';
import 'package:movies_application/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_application/movies/domain/usecases/get_now_playing_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static init() {
    // Remote Data Source
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MoviesRemoteDataSource());

    // repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(moviesRemoteDataSource: sl()));

    //use case
    sl.registerLazySingleton<GetNowPlayingUseCase>(
        () => GetNowPlayingUseCase(sl()));
  }
}
