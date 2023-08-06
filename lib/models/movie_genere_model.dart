class MovieGenreModel {
  final int id;
  final String name;

  MovieGenreModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"];
}
