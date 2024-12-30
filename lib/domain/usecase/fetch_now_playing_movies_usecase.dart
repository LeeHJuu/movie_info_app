import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';

class FetchNowPlayingMoviesUsecase {
  final MovieRepository _movieRepository;
  FetchNowPlayingMoviesUsecase(this._movieRepository);

  Future<List<Movie>?> execute() async {
    return await _movieRepository.fetchNowPlayingMovies();
  }
}
