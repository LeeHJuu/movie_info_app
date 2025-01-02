import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.genres,
  });

  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.3,
          ),
        ),
      ),
      child: SizedBox(
        height: 40,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) {
            final genre = genres[index];
            return Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  genre,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 4);
          },
        ),
      ),
    );
  }
}
