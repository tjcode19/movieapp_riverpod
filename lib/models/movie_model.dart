import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  final int? id;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  final List<Genres>? genres;
  final int? runtime;
  final String? title;
  final double? voteAverage;
  final int? voteCount;

  const MovieModel(
      {this.id,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.genres,
      this.runtime,
      this.title,
      this.voteAverage,
      this.voteCount});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    var genres = <Genres>[];
    if (json['genres'] != null) {
      genres = List<Genres>.from(json['genres'].map((x) => Genres.fromJson(x)));
    }
    return MovieModel(
      genres: genres,
      id: json['id'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      title: json['title'],
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['runtime'] = runtime;
    data['title'] = title;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }

  @override
  List<Object?> get props => [id];
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class MovieResults {
  List<MovieModel>? movies;

  MovieResults({
    required this.movies,
  });

  MovieResults.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      movies = <MovieModel>[];
      json['results'].forEach((v) {
        movies!.add(MovieModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (movies != null) {
      data['results'] = movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
