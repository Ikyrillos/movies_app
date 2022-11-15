class AppConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '5cde2abcab8a01512cc86a1452395ec8';
  static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String topRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';
  static String movieDetailsPath(int id)=>
      '$baseUrl/movie/$id?api_key=$apiKey';
  static String recommendationPath(int id)=>
      '$baseUrl/movie/$id/recommendations?api_key=$apiKey';

    // {movie_id}?api_key=<<api_key>>&language=en-US
  static const String popularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path';
}
