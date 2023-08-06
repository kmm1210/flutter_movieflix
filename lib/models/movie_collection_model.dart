class MovieCollectionModel {
  final num id;
  final String name, posterPath;
  final String? backdropPath;

  MovieCollectionModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        posterPath = json["posterPath"],
        backdropPath = json["backdrop_path"];
}
