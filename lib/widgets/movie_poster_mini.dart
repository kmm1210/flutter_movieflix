import 'package:flutter/material.dart';
import 'package:flutter_movieflix/models/movie_model.dart';
import 'package:flutter_movieflix/screens/detail_screen.dart';

class MoviePosterMini extends StatelessWidget {
  const MoviePosterMini({
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
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            Hero(
              tag: '${movie.id}${movie.movieType}',
              child: Container(
                width: 150,
                height: 180,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
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
    
            Text(
              movie.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}