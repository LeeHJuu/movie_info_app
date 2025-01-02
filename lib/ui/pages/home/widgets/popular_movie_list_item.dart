import 'package:flutter/material.dart';
import 'package:movie_info_app/ui/pages/detail/detail_page.dart';
import 'package:movie_info_app/ui/pages/home/home_page.dart';
import 'package:movie_info_app/ui/pages/home/widgets/movie_poster_image.dart';

class PopularMovieListItem extends StatelessWidget {
  MovieItemOption option;
  int index;
  PopularMovieListItem(this.option, this.index);

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
      child: SizedBox(
        width: 150,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            MoviePosterImage(option),
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
}
