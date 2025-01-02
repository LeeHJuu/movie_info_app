import 'package:flutter/material.dart';
import 'package:movie_info_app/ui/pages/detail/detail_page.dart';
import 'package:movie_info_app/ui/pages/home/home_page.dart';
import 'package:movie_info_app/ui/pages/home/widgets/movie_poster_image.dart';

class MovieListItem extends StatelessWidget {
  MovieItemOption option;
  MovieListItem(this.option);

  @override
  Widget build(BuildContext context) {
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
      child: MoviePosterImage(option),
    );
  }
}
