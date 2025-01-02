import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/constant.dart';
import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/ui/pages/detail/detail_page.dart';
import 'package:movie_info_app/ui/pages/home/home_view_model.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(homeViewModel);

    return Scaffold(
      // appBar: AppBar(),
      body: ListView(
        children: [
          mostPopular(
            context,
            vm.popularMovies?.first ??
                Movie(
                    id: 0,
                    posterPath: vm.popularMovies?.first.posterPath ?? ''),
          ),
          movieCarousel(context, NOW_PLAYING_LIST_TITLE, vm.nowPlayingMovies),
          movieCarousel(context, POPULAR_LIST_TITLE, vm.popularMovies),
          movieCarousel(context, TOP_RATED_LIST_TITLE, vm.topRatedMovies),
          movieCarousel(context, UPCOMING_LIST_TITLE, vm.upcomingMovies),
        ],
      ),
    );
  }

  Widget mostPopular(BuildContext context, Movie item) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              "가장 인기있는",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          movieListItem(
            context,
            MovieItemOption(
              id: item.id,
              tag: 'mostPopular',
              posterPath: item.posterPath,
              isFullSize: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget movieCarousel(
      BuildContext context, String title, List<Movie>? movies) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: movies?.length ?? 0,
              itemBuilder: (context, index) {
                final item = movies![index];

                final itemOption = MovieItemOption(
                  id: item.id,
                  tag: "${title}_${index}",
                  posterPath: item.posterPath,
                  isFullSize: false,
                );

                if (title == POPULAR_LIST_TITLE) {
                  return popularMovieItem(context, itemOption, index);
                } else {
                  return movieListItem(context, itemOption);
                }
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 12);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget popularMovieItem(
    BuildContext context,
    MovieItemOption option,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              id: option.id,
              posterPath: option.posterPath,
              tag: option.tag,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 150,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            moviePosterImage(option),
            Positioned(
              bottom: -30,
              left: 0,
              child: SizedBox(
                width: 120,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 110,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector movieListItem(
    BuildContext context,
    MovieItemOption option,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              id: option.id,
              posterPath: option.posterPath,
              tag: option.tag,
            ),
          ),
        );
      },
      child: moviePosterImage(option),
    );
  }

  Hero moviePosterImage(MovieItemOption option) {
    return Hero(
      tag: option.tag,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: option.isFullSize ? double.infinity : 120,
          height: option.isFullSize ? null : 180,
          child: Image.network(
            'https://image.tmdb.org/t/p/w500${option.posterPath}',
            fit: BoxFit.cover,
          ),
        ),
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
