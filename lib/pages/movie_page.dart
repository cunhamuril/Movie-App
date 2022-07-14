import 'package:flutter/material.dart';
import 'package:movie_app/components/movie_content.dart';
import 'package:movie_app/components/movie_header.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const MovieHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  SizedBox(height: 32),
                  MovieContent(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
