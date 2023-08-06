import 'package:flutter/material.dart';
import 'package:flutter_movieflix/models/movie_detail_model.dart';
import 'package:flutter_movieflix/models/movie_model.dart';
import 'package:flutter_movieflix/services/api_service.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailScreen extends StatefulWidget {
  final MovieModel movie;

  const DetailScreen({
    super.key,
    required this.movie,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel> movieDetail;

  @override
  void initState() {
    super.initState();
    movieDetail = ApiService.getMovieDetailById(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${widget.movie.id}${widget.movie.movieType}',
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.movie.posterPath),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                  future: movieDetail,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var genreNames = snapshot.data!.genres.map((e) => e.name);
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 200,
                            ),
                            Text(
                              snapshot.data!.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            RatingBar(
                              initialRating:
                                  (snapshot.data!.voteAverage / 2).toDouble(),
                              minRating: 0.0,
                              maxRating: 10.0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              ratingWidget: RatingWidget(
                                full: const Icon(
                                  Icons.star_rounded,
                                  color: Colors.amber,
                                ),
                                half: const Icon(
                                  Icons.star_half_rounded,
                                  color: Colors.amber,
                                ),
                                empty: const Icon(
                                  Icons.star_outline_rounded,
                                  color: Colors.amber,
                                ),
                              ),
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            Text(
                              '${snapshot.data!.runTimeFormat} | ${genreNames.join(", ")}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const Text(
                              'Storyline',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              snapshot.data!.overview,
                              style: const TextStyle(
                                color: Colors.white,
                                height: 1.2,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80, vertical: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text(
                                    'Buy ticket',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                          ],
                        ),
                      );
                    }
                    return const Text('....');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
