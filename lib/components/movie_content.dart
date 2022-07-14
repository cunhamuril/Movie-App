import 'package:flutter/material.dart';
import 'package:movie_app/components/genre_tile.dart';
import 'package:movie_app/components/person_tile.dart';
import 'package:movie_app/models/genre.dart';

class MovieContent extends StatelessWidget {
  const MovieContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _Heading(),
        SizedBox(height: 32),
        _Summary(),
        SizedBox(height: 48),
        _Cast(),
      ],
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading({
    Key? key,
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
                'Ford v Ferrari',
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
                    '2019',
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
                    '2h 32m',
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
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            children: [
              GenreTile(genre: Genre(id: 0, name: 'Action')),
              GenreTile(genre: Genre(id: 1, name: 'Biography')),
              GenreTile(genre: Genre(id: 2, name: 'Drama')),
            ],
          ),
        )
      ],
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Plot Summary',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).textTheme.bodyText1?.color,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.',
          ),
        ],
      ),
    );
  }
}

class _Cast extends StatelessWidget {
  const _Cast({
    Key? key,
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
                'Cast & Crew',
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
        SizedBox(
          height: 190,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            scrollDirection: Axis.horizontal,
            children: const [
              PersonTile(),
              PersonTile(),
              PersonTile(),
              PersonTile(),
              PersonTile(),
              PersonTile(),
              PersonTile(),
              PersonTile(),
              PersonTile(),
            ],
          ),
        ),
      ],
    );
  }
}
