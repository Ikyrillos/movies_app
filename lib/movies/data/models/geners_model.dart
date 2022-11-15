import 'package:movies_application/movies/domain/entities/genre.dart';

class GenreModel extends Genre {
  GenreModel({
    required super.id,
    required super.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }
   
}
