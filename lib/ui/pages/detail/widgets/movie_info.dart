import 'package:flutter/material.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({
    super.key,
    required this.title,
    required this.tagline,
    required this.runtime,
    required this.releaseDate,
  });

  final String title;
  final String tagline;
  final int runtime;
  final DateTime? releaseDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.3,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(releaseDate?.toIso8601String().substring(0, 10) ?? ''),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tagline),
              Text('${runtime}분'),
            ],
          ),
        ],
      ),
    );
  }
}
