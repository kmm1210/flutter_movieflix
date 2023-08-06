// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_movieflix/models/movie_model.dart';
import 'package:flutter_movieflix/services/api_service.dart';
import 'package:flutter_movieflix/widgets/movie_poster.dart';
import 'package:flutter_movieflix/widgets/movie_poster_mini.dart';

class HomeScreen extends StatelessWidget {
  Future<List<MovieModel>> populars = ApiService.getPopularMovies();
  Future<List<MovieModel>> plays = ApiService.getPlayMovies();
  Future<List<MovieModel>> cominsoons = ApiService.getComingsoonMovies();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            SizedBox(
              height: 340,
              child: FutureBuilder(
                future: populars,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(
                            'Popluar Movies',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: makePopluarMovieList(snapshot),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 320,
              child: FutureBuilder(
                future: plays,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(
                            'Now in Cinemas',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: makeMovieList(snapshot),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 380,
              child: FutureBuilder(
                future: cominsoons,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(
                            'Coming soon',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: makeMovieList(snapshot),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView makeMovieList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return MoviePosterMini(movie: movie);
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 15,
      ),
    );
  }

  ListView makePopluarMovieList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return MoviePoster(movie: movie);
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 15,
      ),
    );
  }
}
