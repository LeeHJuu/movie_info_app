import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/ui/pages/detail/detail_view_model.dart';
import 'package:movie_info_app/ui/pages/home/home_page.dart';

class DetailPage extends ConsumerWidget {
  final String tag;
  final String posterPath;
  final int id;

  DetailPage({
    required this.id,
    required this.posterPath,
    required this.tag,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(detailViewModel(id)) ?? null;

    if (vm != null) {
      return Scaffold(
        body: ListView(
          children: [
            movieImage(posterPath),
            movieInfo(vm.title, vm.tagline, vm.runtime, vm.releaseDate),
            categories(vm.genres),
            summary(vm.overview),
            performanceInfo({
              '평점': vm.voteAverage,
              '평점투표수': vm.voteCount,
              '인기점수': vm.popularity,
              '예산': '\$${vm.budget}',
              '수익': '\$${vm.revenue}',
            }),
            manufacturer(vm.productionCompanyLogos),
            SizedBox(height: 20),
          ],
        ),
      );
    } else {
      return Center(
        child: Text("NO DATA"),
      );
    }
  }

  Widget movieImage(String posterPath) {
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

  Widget movieInfo(
      String title, String tagline, int runtime, DateTime? releaseDate) {
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

  Widget categories(List<String> genres) {
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

  Widget summary(String overview) {
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
      child: Text(overview),
    );
  }

  Widget performanceInfo(Map<String, dynamic> map) {
    final infoList = map.entries.toList();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              "흥행정보",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 85,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: infoList.length,
              itemBuilder: (context, index) {
                final item = infoList[index];
                return Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${item.value}'),
                      Text(item.key),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 12);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget manufacturer(List<String> productionCompanyLogos) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SizedBox(
        height: 80,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: productionCompanyLogos.length,
          itemBuilder: (context, index) {
            final logoPath = productionCompanyLogos[index];
            return Opacity(
              opacity: 0.9,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(20),
                child: Image.network(
                  'https://image.tmdb.org/t/p/original${logoPath}',
                  fit: BoxFit.fitHeight,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 12);
          },
        ),
      ),
    );
  }
}
