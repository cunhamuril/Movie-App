import 'package:flutter/material.dart';
import 'package:movie_app/components/genre_tile.dart';
import 'package:movie_app/components/person_tile.dart';
import 'package:movie_app/http/clients/movie_client.dart';
import 'package:movie_app/models/cast.dart';
import 'package:movie_app/models/genre.dart';
import 'package:movie_app/models/movie.dart';

class MovieContent extends StatelessWidget {
  final Movie movie;

  const MovieContent({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Heading(
          movieTitle: movie.title,
          movieReleaseDate: movie.releaseDate!,
          movieRuntime: movie.runtime!,
          movieGenres: movie.genres!,
        ),
        const SizedBox(height: 32),
        _Overview(
          movieOverview: movie.overview!,
        ),
        const SizedBox(height: 48),
        _Cast(movieId: movie.id),
      ],
    );
  }
}

class _Heading extends StatelessWidget {
  final String movieTitle;
  final String movieReleaseDate;
  final int movieRuntime;
  final List<Genre> movieGenres;

  const _Heading({
    Key? key,
    required this.movieTitle,
    required this.movieReleaseDate,
    required this.movieRuntime,
    required this.movieGenres,
  }) : super(key: key);

  String getMovieReleaseYear() {
    return movieReleaseDate.split('-')[0];
  }

  String getMovieRunTimeInHoursAndMinutes() {
    Duration duration = Duration(minutes: movieRuntime);

    String hours = duration.toString().split(':')[0];
    String minutes = duration.toString().split(':')[1];

    return '${hours}h ${minutes}m';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movieTitle,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.bodyText1?.color,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    getMovieReleaseYear(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).textTheme.bodyText2?.color,
                    ),
                  ),
                  const SizedBox(width: 28),
                  Text(
                    'PG-13',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).textTheme.bodyText2?.color,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Text(
                    getMovieRunTimeInHoursAndMinutes(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).textTheme.bodyText2?.color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 40,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            itemCount: movieGenres.length,
            itemBuilder: (context, index) {
              final Genre genre = movieGenres[index];

              return GenreTile(genre: Genre(id: genre.id, name: genre.name));
            },
          ),
        )
      ],
    );
  }
}

class _Overview extends StatelessWidget {
  final String movieOverview;

  const _Overview({
    Key? key,
    required this.movieOverview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visão geral',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).textTheme.bodyText1?.color,
            ),
          ),
          const SizedBox(height: 16),
          Text(movieOverview),
        ],
      ),
    );
  }
}

class _Cast extends StatelessWidget {
  final MovieClient movieClient = MovieClient();

  final int movieId;

  _Cast({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Elenco',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.bodyText1?.color,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        FutureBuilder<List<Cast>>(
          future: movieClient.findMovieCast(movieId),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              final List<Cast> cast = snapshot.data ?? [];

              return SizedBox(
                height: 190,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  scrollDirection: Axis.horizontal,
                  itemCount: cast.length,
                  itemBuilder: (context, index) {
                    return PersonTile(cast: cast[index]);
                  },
                ),
              );
            }

            return const Text('Unknown error');
          }),
        )
      ],
    );
  }
}
