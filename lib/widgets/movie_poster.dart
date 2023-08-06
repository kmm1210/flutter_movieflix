import 'package:flutter/material.dart';
import 'package:flutter_movieflix/models/movie_model.dart';
import 'package:flutter_movieflix/screens/detail_screen.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(movie: movie),
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: '${movie.id}${movie.movieType}',
            child: Container(
              width: 340,
              height: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(5, 5),
                    color: Colors.black.withOpacity(0.6),
                  ),
                ],
              ),
              child: Image.network(
                movie.posterPath,
                headers: imageUserAgent,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
