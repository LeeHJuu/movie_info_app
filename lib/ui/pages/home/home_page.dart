import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/constant.dart';
import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/ui/pages/home/home_view_model.dart';
import 'package:movie_info_app/ui/pages/home/widgets/most_popular_movie.dart';
import 'package:movie_info_app/ui/pages/home/widgets/movie_carousel.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(homeViewModel);

    return Scaffold(
      body: ListView(
        children: [
          mostPopularMovie(
            context: context,
            item: vm.popularMovies?.first ??
                Movie(
                  id: 0,
                  posterPath: vm.popularMovies?.first.posterPath ?? '',
                ),
          ),
          MovieCarousel(
            context: context,
            title: NOW_PLAYING_LIST_TITLE,
            movies: vm.nowPlayingMovies,
          ),
          MovieCarousel(
            context: context,
            title: POPULAR_LIST_TITLE,
            movies: vm.popularMovies,
          ),
          MovieCarousel(
            context: context,
            title: TOP_RATED_LIST_TITLE,
            movies: vm.topRatedMovies,
          ),
          MovieCarousel(
            context: context,
            title: UPCOMING_LIST_TITLE,
            movies: vm.upcomingMovies,
          ),
        ],
      ),
    );
  }
}

class MovieItemOption {
  int id;
  String tag;
  String posterPath;
  bool isFullSize;

  MovieItemOption({
    required this.id,
    required this.tag,
    required this.posterPath,
    required this.isFullSize,
  });
}
