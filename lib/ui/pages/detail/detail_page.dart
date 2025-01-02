import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/ui/pages/detail/detail_view_model.dart';
import 'package:movie_info_app/ui/pages/detail/widgets/categories.dart';
import 'package:movie_info_app/ui/pages/detail/widgets/manufactures.dart';
import 'package:movie_info_app/ui/pages/detail/widgets/movie_image.dart';
import 'package:movie_info_app/ui/pages/detail/widgets/movie_info.dart';
import 'package:movie_info_app/ui/pages/detail/widgets/performance_info.dart';
import 'package:movie_info_app/ui/pages/detail/widgets/summary.dart';

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
            MovieImage(tag: tag, posterPath: posterPath),
            MovieInfo(
                title: vm.title,
                tagline: vm.tagline,
                runtime: vm.runtime,
                releaseDate: vm.releaseDate),
            Categories(genres: vm.genres),
            Summary(overview: vm.overview),
            PerformanceInfo(map: {
              '평점': vm.voteAverage,
              '평점투표수': vm.voteCount,
              '인기점수': vm.popularity,
              '예산': '\$${vm.budget}',
              '수익': '\$${vm.revenue}',
            }),
            Manufactures(productionCompanyLogos: vm.productionCompanyLogos),
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
}
