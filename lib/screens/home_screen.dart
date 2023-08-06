// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_movieflix/models/movie_model.dart';
import 'package:flutter_movieflix/services/api_service.dart';

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
            Container(
              height: 500,
              decoration: const BoxDecoration(
                
              ),
              child: FutureBuilder(
                future: populars,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
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
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            itemBuilder: (context, index) {
                              var movie = snapshot.data![index];
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
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                              // return Text(webtoon.title);
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 15,
                            ),
                          ),
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
              height: 400,
              child: FutureBuilder(
                future: plays,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
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
                          child: Container(),
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
              height: 400,
              child: FutureBuilder(
                future: cominsoons,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
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
                          child: Container(),
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
}
