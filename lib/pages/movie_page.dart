import 'package:flutter/material.dart';
import 'package:movie_app/components/movie_content.dart';
import 'package:movie_app/components/movie_header.dart';
import 'package:movie_app/http/clients/movie_client.dart';
import 'package:movie_app/models/movie.dart';

class MoviePage extends StatelessWidget {
  final MovieClient movieClient = MovieClient();

  final int movieId;

  MoviePage({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder<Movie>(
        future: movieClient.findMovieById(movieId),
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
            final Movie movie = snapshot.data!;

            return Column(
              children: [
                MovieHeader(movie: movie),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 32),
                        MovieContent(movie: movie),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return const Text('Unknown error');
        }),
      ),
    );
  }
}
