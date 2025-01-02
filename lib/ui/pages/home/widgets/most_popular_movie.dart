import 'package:flutter/material.dart';
import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/ui/pages/home/home_page.dart';
import 'package:movie_info_app/ui/pages/home/widgets/movie_list_item.dart';

class mostPopularMovie extends StatelessWidget {
  const mostPopularMovie({
    super.key,
    required this.context,
    required this.item,
  });

  final BuildContext context;
  final Movie item;

  @override
  Widget build(BuildContext context) {
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
          MovieListItem(
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
}
