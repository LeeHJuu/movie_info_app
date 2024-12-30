import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/ui/pages/detail/detail_page.dart';
import 'package:movie_info_app/ui/pages/home/home_view_model.dart';

String imageUrl = 'https://picsum.photos/200/300';

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
                Movie(id: 0, posterPath: '/b5UXjzW5cLZhprMnlAmsVAA3G4t.jpg'),
          ),
          movieCarousel(context, "현재 상영중", vm.nowPlayingMovies),
          movieCarousel(context, "인기순", vm.popularMovies),
          movieCarousel(context, "평점 높은순", vm.topRatedMovies),
          movieCarousel(context, "개봉예정", vm.upcomingMovies),
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
          movieImage(
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

  GestureDetector movieImage(
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
      child: Hero(
        tag: option.tag,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: option.isFullSize ? double.infinity : 120,
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${option.posterPath}',
              fit: BoxFit.cover,
            ),
          ),
        ),
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

                return movieImage(context, itemOption);
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
