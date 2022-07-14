import 'package:flutter/material.dart';
import 'package:movie_app/config/api.dart';
import 'package:movie_app/models/movie.dart';

class MovieHeader extends StatelessWidget {
  final Movie movie;

  const MovieHeader({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
            ),
            child: Image.network(
              movie.cover!,
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
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: FractionallySizedBox(
              widthFactor: 0.9,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                height: 112,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber[600],
                          size: 40,
                        ),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText1,
                            children: [
                              TextSpan(
                                text: movie.rate.toString(),
                                style: const TextStyle(
                                  fontSize: 19,
                                ),
                              ),
                              TextSpan(
                                text: '/10',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.color
                                      ?.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          movie.voteCount!.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.color
                                ?.withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.star_border, size: 40),
                        const SizedBox(height: 2),
                        Text(
                          'Avaliar',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).textTheme.bodyText1?.color,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.greenAccent[700],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              '86',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          'Metascore',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).textTheme.bodyText1?.color,
                          ),
                        ),
                        Text(
                          '62 críticas',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.color
                                ?.withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
