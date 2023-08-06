import 'package:flutter_movieflix/models/movie_collection_model.dart';
import 'package:flutter_movieflix/models/movie_genere_model.dart';
import 'package:flutter_movieflix/models/movie_model.dart';
import 'package:flutter_movieflix/models/production_company_model.dart';
import 'package:flutter_movieflix/models/production_country_model.dart';

class MovieDetailModel extends MovieModel {
  final List<MovieCollectionModel> belongsToCollection;
  final int budget;
  final List<MovieGenreModel> genres;
  final String homepage, imdbId;
  final List<ProductionCompanyModel> productionCompanies;
  final List<ProductionCountryModel> productionCountries;
  final String status, tagline;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : belongsToCollection = convertBelongsToCollection(json["belongs_to_collection"] ?? []),
        budget = json["budget"],
        genres = convertGenre(json["genres"] ?? []),
        homepage = json["homepage"],
        imdbId = json["imdb_id"],
        productionCompanies = convertProductionCompany(json["production_companies"] ?? []),
        productionCountries = convertProductionCountry(json["production_countries"] ?? []),
        status = json["status"],
        tagline = json["tagline"],
        super.fromJson(json);

  static List<MovieCollectionModel> convertBelongsToCollection(List<Map<String, dynamic>> json) {
    List<MovieCollectionModel> collections = [];
    for (var element in json) {
      collections.add(MovieCollectionModel.fromJson(element));
    }
    return collections;
  }

  static List<MovieGenreModel> convertGenre(List<Map<String, dynamic>> json) {
    List<MovieGenreModel> genres = [];
    for (var element in json) {
      genres.add(MovieGenreModel.fromJson(element));
    }
    return genres;
  }

  static List<ProductionCompanyModel> convertProductionCompany(List<Map<String, dynamic>> json) {
    List<ProductionCompanyModel> companies = [];
    for (var element in json) {
      companies.add(ProductionCompanyModel.fromJson(element));
    }
    return companies;
  }

  static List<ProductionCountryModel> convertProductionCountry(List<Map<String, dynamic>> json) {
    List<ProductionCountryModel> contries = [];
    for (var element in json) {
      contries.add(ProductionCountryModel.fromJson(element));
    }
    return contries;
  }
}
