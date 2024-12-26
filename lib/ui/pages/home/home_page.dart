import 'package:flutter/material.dart';

String imageUrl = 'https://picsum.photos/200/300';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: ListView(
        children: [
          mostPopular(),
          movieCarousel("현재 상영중"),
          movieCarousel("인기순"),
          movieCarousel("평점 높은순"),
          movieCarousel("개봉예정"),
        ],
      ),
    );
  }

  Widget mostPopular() {
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
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: double.infinity,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget movieCarousel(String title) {
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
              itemCount: 20,
              itemBuilder: (context, index) {
                return movieItem();
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

  Widget movieItem() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}