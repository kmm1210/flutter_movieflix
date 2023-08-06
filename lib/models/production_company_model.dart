class ProductionCompanyModel {
  final num id;
  final String logoPath, name, originCountry;

  ProductionCompanyModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        logoPath = json["logo_path"],
        name = json["name"],
        originCountry = json["origin_country"];
}
