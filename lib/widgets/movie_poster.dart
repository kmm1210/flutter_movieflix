import 'package:flutter/material.dart';
import 'package:flutter_movieflix/models/movie_model.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
      ],
    );
  }
}


