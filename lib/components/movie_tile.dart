import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/pages/movie_page.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;

  const MovieTile({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MoviePage(movieId: movie.id),
            ),
          );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: movie.poster != null
                  ? Image.network(
                      movie.poster!,
                      width: 210,
                      height: 320,
                      fit: BoxFit.cover,
                      loadingBuilder: (
                        BuildContext context,
                        Widget child,
                        ImageChunkEvent? loadingProgress,
                      ) {
                        if (loadingProgress == null) return child;

                        final double? loadingPercent =
                            loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null;

                        return Container(
                          height: 310,
                          width: 210,
                          decoration: BoxDecoration(
                            color: Colors.black54.withOpacity(0.3),
                          ),
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingPercent,
                            ),
                          ),
                        );
                      },
                    )
                  : Container(
                      height: 310,
                      width: 210,
                      decoration:
                          BoxDecoration(color: Colors.black54.withOpacity(0.3)),
                    ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                SizedBox(
                  width: 210,
                  child: Text(
                    movie.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).textTheme.bodyText1?.color,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_rate,
                      color: Colors.amber[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      movie.rate.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
