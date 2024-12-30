class MovieDetailDto {
  bool adult;
  String backdropPath;
  BelongsToCollection belongsToCollection;
  int budget;
  List<Genre> genres;
  String homepage;
  int id;
  String imdbId;
  List<String> originCountry;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  List<ProductionCompany> productionCompanies;
  List<ProductionCountry> productionCountries;
  DateTime releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDetailDto({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieDetailDto.fromJson(Map<String, dynamic> json)
      : this(
          adult: json['adult'],
          backdropPath: json['backdrop_path'],
          belongsToCollection:
              BelongsToCollection.fromJson(json['belongs_to_collection']),
          budget: json['budget'],
          genres: (json['genres'] as List)
              .map((genre) => Genre.fromJson(genre))
              .toList(),
          homepage: json['homepage'],
          id: json['id'],
          imdbId: json['imdb_id'],
          originCountry: List<String>.from(json['origin_country']),
          originalLanguage: json['original_language'],
          originalTitle: json['original_title'],
          overview: json['overview'],
          popularity: json['popularity'].toDouble(),
          posterPath: json['poster_path'],
          productionCompanies: (json['production_companies'] as List)
              .map((company) => ProductionCompany.fromJson(company))
              .toList(),
          productionCountries: (json['production_countries'] as List)
              .map((country) => ProductionCountry.fromJson(country))
              .toList(),
          releaseDate: DateTime.parse(json['release_date']),
          revenue: json['revenue'],
          runtime: json['runtime'],
          spokenLanguages: (json['spoken_languages'] as List)
              .map((language) => SpokenLanguage.fromJson(language))
              .toList(),
          status: json['status'],
          tagline: json['tagline'],
          title: json['title'],
          video: json['video'],
          voteAverage: json['vote_average'].toDouble(),
          voteCount: json['vote_count'],
        );
}

class BelongsToCollection {
  int id;
  String name;
  String posterPath;
  String backdropPath;

  BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  BelongsToCollection.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          posterPath: json['poster_path'],
          backdropPath: json['backdrop_path'],
        );
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  Genre.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
        );
}

class ProductionCompany {
  int id;
  String logoPath;
  String name;
  String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  ProductionCompany.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          logoPath: json['logo_path'] ?? '',
          name: json['name'],
          originCountry: json['origin_country'],
        );
}

class ProductionCountry {
  String iso31661;
  String name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  ProductionCountry.fromJson(Map<String, dynamic> json)
      : this(
          iso31661: json['iso_3166_1'],
          name: json['name'],
        );
}

class SpokenLanguage {
  String englishName;
  String iso6391;
  String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  SpokenLanguage.fromJson(Map<String, dynamic> json)
      : this(
          englishName: json['english_name'],
          iso6391: json['iso_639_1'],
          name: json['name'],
        );
}
