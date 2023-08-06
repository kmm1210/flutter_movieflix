enum MovieType { popular, play, comingsoon, detail, none }
const imageAbsPath = "https://image.tmdb.org/t/p/w500";
const imageUserAgent = {"User-Agent":  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"};

class MovieModel {
  final bool adult;
  final String backdropPath;
  final List<dynamic> genreIds;
  final num id;
  final String originalLanguage, originalTitle, overview;
  final num popularity;
  final String posterPath, releaseDate, title;
  final bool video;
  final num voteAverage, voteCount;
  final MovieType movieType;

  MovieModel.fromJson(Map<String, dynamic> json, MovieType type)
      : adult = json["adult"],
        backdropPath = "$imageAbsPath${json["backdrop_path"]}",
        genreIds = json["genre_ids"] ?? [],
        id = json["id"],
        originalLanguage = json["original_language"],
        originalTitle = json["original_title"],
        overview = json["overview"],
        popularity = json["popularity"],
        posterPath = "$imageAbsPath${json["poster_path"]}",
        releaseDate = json["release_date"],
        title = json["title"],
        video = json["video"],
        voteAverage = json["vote_average"],
        voteCount = json["vote_count"],
        movieType = type;
}
