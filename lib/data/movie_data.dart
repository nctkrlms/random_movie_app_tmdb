import 'dart:convert';

class Movie {
  final String title;
  final String tagline;
  final String releaseDate;
  final String imagePath;
  final String posterPath;
  final String description;
  final bool adult;
  // final String director;
  final List<dynamic> genres;
  final double movieRate;


  const Movie({
    required this.imagePath,
    required this.posterPath,
    required this.description,
    required this.title,
    required this.adult,
    required this.tagline,
    // required this.director,
    required this.genres,
    required this.movieRate,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(

      imagePath: json['backdrop_path'],
      description: json['overview'],
      adult: json['adult'],
      title: json['title'],
      // director: json['director'],
      genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      movieRate: json['vote_average'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
      tagline: json['tagline'],
    );
  }
}
class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

