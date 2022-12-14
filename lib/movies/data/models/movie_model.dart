import 'package:movies_application/movies/domain/entities/movies.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: DateTime.parse(json['release_date']),
      );
}
