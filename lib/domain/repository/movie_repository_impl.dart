import 'package:movie_info_app/data/data_source/movie_data_source.dart';
import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/domain/entity/movie_detail.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _movieDataSource;
  MovieRepositoryImpl(this._movieDataSource);

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) async {
    final result = await _movieDataSource.fetchMovieDetail(id);
    if (result != null) {
      return MovieDetail(
          budget: result.budget,
          genres: result.genres.map((e) => e.name).toList(),
          id: id,
          productionCompanyLogos:
              result.productionCompanies.map((e) => e.logoPath).toList(),
          overview: result.overview,
          popularity: result.popularity,
          releaseDate: result.releaseDate,
          revenue: result.revenue,
          runtime: result.runtime,
          tagline: result.tagline,
          title: result.title,
          voteAverage: result.voteAverage,
          voteCount: result.voteCount);
    } else {
      return null;
    }
  }

  @override
  Future<List<Movie>?> fetchNowPlayingMovies() async {
    final result = await _movieDataSource.fetchNowPlayingMovies();
    return result
        ?.map(
          (e) => Movie(
            id: e.id,
            posterPath: e.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<List<Movie>?> fetchPopularMovies() async {
    final result = await _movieDataSource.fetchPopularMovies();
    return result
        ?.map(
          (e) => Movie(
            id: e.id,
            posterPath: e.backdropPath,
          ),
        )
        .toList();
  }

  @override
  Future<List<Movie>?> fetchTopRatedMovies() async {
    final result = await _movieDataSource.fetchTopRatedMovies();
    return result
        ?.map(
          (e) => Movie(
            id: e.id,
            posterPath: e.backdropPath,
          ),
        )
        .toList();
  }

  @override
  Future<List<Movie>?> fetchUpcomingMovies() async {
    final result = await _movieDataSource.fetchUpcomingMovies();
    return result
        ?.map(
          (e) => Movie(
            id: e.id,
            posterPath: e.backdropPath,
          ),
        )
        .toList();
  }
}
