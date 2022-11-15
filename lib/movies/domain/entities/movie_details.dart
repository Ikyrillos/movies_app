import 'package:equatable/equatable.dart';
import 'package:movies_application/movies/domain/entities/genre.dart';

class MovieDetails extends Equatable {
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final List<Genre> genres;
  final double voteAverage;
  final int voteCount;
  final int id;
  final int runtime;

  const MovieDetails({
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.id,
    required this.runtime,
    required this.genres,
  });

  @override
  List<Object> get props => [
        title,
        overview,
        posterPath,
        backdropPath,
        releaseDate,
        voteAverage,
        voteCount,
        id,
        runtime,
        genres,
      ];
}
