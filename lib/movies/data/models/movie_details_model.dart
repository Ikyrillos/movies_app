import 'package:movies_application/movies/data/models/geners_model.dart';
import 'package:movies_application/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.releaseDate,
    required super.voteAverage,
    required super.voteCount,
    required super.id,
    required super.runtime,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'] ?? '/c6OLXfKAk5BKeR6broC8pYiCquX.jpg',
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
      id: json['id'],
      runtime: json['runtime'],
      genres: List<GenreModel>.from(
        json['genres'].map(
          (genre) => GenreModel.fromJson(genre),
        ),
      ),
    );
  }
}
