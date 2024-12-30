import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/ui/providers.dart';

class Homestate {
  List<Movie>? nowPlayingMovies;
  List<Movie>? popularMovies;
  List<Movie>? topRatedMovies;
  List<Movie>? upcomingMovies;

  Homestate({
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upcomingMovies,
  });
}

class HomeViewModel extends Notifier<Homestate> {
  @override
  Homestate build() {
    fetchMovies();
    return Homestate(
      nowPlayingMovies: null,
      popularMovies: null,
      topRatedMovies: null,
      upcomingMovies: null,
    );
  }

  Future<void> fetchMovies() async {
    final nowPlayingMovies =
        await ref.read(fetchNowPlayingMoviesUsecaseProvider).execute();
    final popularMovies =
        await ref.read(fetchPopularMoviesUsecaseProvider).execute();
    final topRatedMovies =
        await ref.read(fetchTopRateMoviesUsecaseProvider).execute();
    final upcomingMovies =
        await ref.read(fetchUpcomingMoviesUsecaseProvider).execute();

    state = Homestate(
      nowPlayingMovies: nowPlayingMovies,
      popularMovies: popularMovies,
      topRatedMovies: topRatedMovies,
      upcomingMovies: upcomingMovies,
    );
  }
}

final homeViewModel =
    NotifierProvider<HomeViewModel, Homestate>(() => HomeViewModel());
