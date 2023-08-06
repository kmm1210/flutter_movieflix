class ProductionCountryModel {
  final String iso_3166_1, name;

  ProductionCountryModel.fromJson(Map<String, dynamic> json)
      : iso_3166_1 = json["iso_3166_1"],
        name = json["name"];
}
