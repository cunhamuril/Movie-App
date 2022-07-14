import 'package:movie_app/config/api.dart';
import 'package:movie_app/models/genre.dart';

class Movie {
  final int id;
  final String title;
  final num rate;

  final String? poster;
  final String? cover;
  final List<Genre>? genres;
  final String? releaseDate;
  final int? runtime;
  final String? overview;
  final int? voteCount;

  Movie({
    required this.id,
    required this.title,
    required this.rate,
    this.poster,
    this.cover,
    this.releaseDate,
    this.runtime,
    this.genres,
    this.overview,
    this.voteCount,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        rate = json['vote_average'] ?? 1.1,
        poster = json['poster_path'] != null
            ? API_IMAGE_BASE_URL + json['poster_path']
            : null,
        cover = json['backdrop_path'] != null
            ? API_IMAGE_BASE_URL + json['backdrop_path']
            : null,
        releaseDate = json['release_date'],
        runtime = json['runtime'],
        genres = json['genres'] != null && json['genres'].length > 0
            ? json['genres']
                .map<Genre>((genre) => Genre.fromJson(genre))
                .toList()
            : null,
        overview = json['overview'],
        voteCount = json['vote_count'];

  @override
  String toString() {
    return 'Movie: {'
        'title: $title, '
        'poster: $poster, '
        'rate: $rate, '
        'cover: $cover, '
        'releaseDate: $releaseDate, '
        'runtime: $runtime, '
        'genres: ${genres.toString()}, '
        'overview: $overview, '
        'voteCount: $voteCount, '
        '}';
  }
}
