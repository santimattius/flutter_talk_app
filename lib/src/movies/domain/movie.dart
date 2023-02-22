class Movie {
  Movie(
      {required this.backdropPath,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.title});

  final String backdropPath;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String title;

  String get posterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
}
