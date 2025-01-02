import 'package:flutter/material.dart';
import 'package:movie_info_app/constant.dart';
import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/ui/pages/home/home_page.dart';
import 'package:movie_info_app/ui/pages/home/widgets/movie_list_item.dart';
import 'package:movie_info_app/ui/pages/home/widgets/popular_movie_list_item.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({
    super.key,
    required this.context,
    required this.title,
    required this.movies,
  });

  final BuildContext context;
  final String title;
  final List<Movie>? movies;

  @override
  Widget build(BuildContext context) {
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
                  return PopularMovieListItem(itemOption, index);
                } else {
                  return MovieListItem(itemOption);
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
}
