// To parse this JSON data, do
//
//     final tmdbResponse = tmdbResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_talk_app/src/movies/domain/movie.dart';

MovieResponse movieResponseFromJson(String str) =>
    MovieResponse.fromJson(json.decode(str));

String movieResponseToJson(MovieResponse data) => json.encode(data.toJson());

class MovieResponse {
  MovieResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  final int? page;
  final List<MovieModel>? results;
  final int? totalPages;
  final int? totalResults;

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<MovieModel>.from(
                json["results"]!.map((x) => MovieModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class MovieModel extends Movie {
  MovieModel({
    required super.backdropPath,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.posterPath,
    required super.title,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
      };
}
