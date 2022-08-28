import 'package:dio/dio.dart';
import 'package:movies_application/core/error/exceptions.dart';
import 'package:movies_application/core/network/app_constants.dart';
import 'package:movies_application/core/network/error_message_model.dart';
import 'package:movies_application/movies/data/models/movie_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    var response = await Dio().get(
      AppConstants.nowPlayingMoviesPath,
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    var response = await Dio().get(
      AppConstants.popularMoviesPath,
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    var response = await Dio().get(
      AppConstants.topRatedMoviesPath,
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
