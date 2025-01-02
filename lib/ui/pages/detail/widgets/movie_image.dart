import 'package:flutter/material.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    super.key,
    required this.tag,
    required this.posterPath,
  });

  final String tag;
  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: double.infinity,
          child: Image.network(
            'https://image.tmdb.org/t/p/w500${posterPath}',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
