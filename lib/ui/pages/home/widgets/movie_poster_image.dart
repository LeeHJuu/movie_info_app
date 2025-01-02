import 'package:flutter/material.dart';
import 'package:movie_info_app/ui/pages/home/home_page.dart';

class MoviePosterImage extends StatelessWidget {
  MovieItemOption option;
  MoviePosterImage(this.option);

  @override
  Widget build(BuildContext context) {
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
