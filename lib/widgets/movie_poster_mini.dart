import 'package:flutter/material.dart';
import 'package:flutter_movieflix/models/movie_model.dart';

class MoviePosterMini extends StatelessWidget {
  const MoviePosterMini({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Container(
            width: 150,
            height: 180,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
              headers: const {
                "User-Agent":
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
              },
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          Text(
            movie.title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}