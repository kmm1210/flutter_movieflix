import 'dart:convert';

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
      final List<dynamic> movies = jsonDecode(response.body);
      for (var movie in movies) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return [];
    }
    throw Error();
  }

  static Future<List<MovieModel>> getPlayMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse(playMoviesUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body);
      for (var movie in movies) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return [];
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingsoonMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse(comingsoonMoviesUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body);
      for (var movie in movies) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return [];
    }
    throw Error();
  }

  static Future<MovieModel> getMovieById(String id) async {
    final url = Uri.parse('$detailMovieUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieModel.fromJson(movie);
    }
    throw Error();
  }
}
