import 'dart:convert';

import 'package:flutter_movieflix/models/movie_detail_model.dart';
import 'package:flutter_movieflix/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ///가장 인기 있는 영화
  static const String popularMoviesUrl =
      "https://movies-api.nomadcoders.workers.dev/popular";

  ///극장에서 상영 중인 영화
  static const String playMoviesUrl =
      "https://movies-api.nomadcoders.workers.dev/now-playing";

  ///곧 개봉하는 영화
  static const String comingsoonMoviesUrl =
      "https://movies-api.nomadcoders.workers.dev/coming-soon";

  ///영화에 대한 세부 정보
  static const String detailMovieUrl =
      "https://movies-api.nomadcoders.workers.dev/movie?id=";

  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse(popularMoviesUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      if (data.containsKey("results")) {
        final List<dynamic> movies = data["results"];
        for (var movie in movies) {
          movieInstances.add(MovieModel.fromJson(movie,MovieType.popular));
        }
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getPlayMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse(playMoviesUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      if (data.containsKey("results")) {
        final List<dynamic> movies = data["results"];
        for (var movie in movies) {
          movieInstances.add(MovieModel.fromJson(movie,MovieType.play));
        }
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingsoonMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse(comingsoonMoviesUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      if (data.containsKey("results")) {
        final List<dynamic> movies = data["results"];
        for (var movie in movies) {
          movieInstances.add(MovieModel.fromJson(movie,MovieType.comingsoon));
        }
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getMovieDetailById(num id) async {
    final url = Uri.parse('$detailMovieUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(movie);
    }
    throw Error();
  }
}
