import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';

class FetchPopularMoviesUsecase {
  final MovieRepository _movieRepository;
  FetchPopularMoviesUsecase(this._movieRepository);

  Future<List<Movie>?> execute() async {
    return await _movieRepository.fetchPopularMovies();
  }
}
