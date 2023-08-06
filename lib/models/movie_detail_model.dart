import 'package:flutter_movieflix/models/movie_collection_model.dart';
import 'package:flutter_movieflix/models/movie_genere_model.dart';
import 'package:flutter_movieflix/models/movie_model.dart';
import 'package:flutter_movieflix/models/production_company_model.dart';
import 'package:flutter_movieflix/models/production_country_model.dart';

class MovieDetailModel extends MovieModel {
  final MovieCollectionModel belongsToCollection;
  final num budget;
  final List<MovieGenreModel> genres;
  final String homepage, imdbId;
  final List<ProductionCompanyModel> productionCompanies;
  final List<ProductionCountryModel> productionCountries;
  final num revenue, runtime;
  final String runTimeFormat, status, tagline;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : belongsToCollection =
            convertBelongsToCollection(json["belongs_to_collection"] ?? {}),
        budget = json["budget"],
        genres = convertGenre(json["genres"] ?? []),
        homepage = json["homepage"],
        imdbId = json["imdb_id"],
        productionCompanies =
            convertProductionCompany(json["production_companies"] ?? []),
        productionCountries =
            convertProductionCountry(json["production_countries"] ?? []),
        revenue = json["revenue"],
        status = json["status"],
        runtime = json["runtime"],
        runTimeFormat = formatRunTime(json["runtime"]),
        tagline = json["tagline"],
        super.fromJson(json, MovieType.detail);

  static MovieCollectionModel convertBelongsToCollection(
      Map<String, dynamic> json) {
    return MovieCollectionModel.fromJson(json);
  }

  static List<MovieGenreModel> convertGenre(List<dynamic> json) {
    List<MovieGenreModel> genres = [];
    for (var element in json) {
      genres.add(MovieGenreModel.fromJson(element));
    }
    return genres;
  }

  static List<ProductionCompanyModel> convertProductionCompany(
      List<dynamic> json) {
    List<ProductionCompanyModel> companies = [];
    for (var element in json) {
      companies.add(ProductionCompanyModel.fromJson(element));
    }
    return companies;
  }

  static List<ProductionCountryModel> convertProductionCountry(
      List<dynamic> json) {
    List<ProductionCountryModel> contries = [];
    for (var element in json) {
      contries.add(ProductionCountryModel.fromJson(element));
    }
    return contries;
  }

  static String formatRunTime(dynamic runTime) {
    num runtime = runTime;
    int hours = (runTime/60).floor();
    int minute = runTime % 60;
    if (hours != 0) {
      return '${hours}h ${minute}min';
    }
    return '${runtime}min';
  }
}
