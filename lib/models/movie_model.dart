class MovieModel {
  final String adult, backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage, originalTitle, overview;
  final int popularity;
  final String posterPath, releaseDate, title;
  final bool video;
  final int voteAverage, voteCount;

  MovieModel.fromJson(Map<String, dynamic> json)
      : adult = json["adult"],
        backdropPath = json["backdrop_path"],
        genreIds = json["genre_ids"],
        id = json["id"],
        originalLanguage = json["original_language"],
        originalTitle = json["original_title"],
        overview = json["overview"],
        popularity = json["popularity"],
        posterPath = json["poster_path"],
        releaseDate = json["release_date"],
        title = json["title"],
        video = json["video"],
        voteAverage = json["vote_average"],
        voteCount = json["vote_count"];
}
