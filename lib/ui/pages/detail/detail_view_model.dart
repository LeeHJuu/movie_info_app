// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:movie_info_app/domain/entity/movie.dart';
// import 'package:movie_info_app/domain/entity/movie_detail.dart';
// import 'package:movie_info_app/ui/providers.dart';

// class DetailViewModel extends Notifier<MovieDetail?> {
//   @override
//   MovieDetail? build() {
//     fetchMovieDetail();
//     return null;
//   }

//   Future<void> fetchMovieDetail() async {
//     state = await ref.read(fetchMovieDetailUsecaseProvider).execute(id);
//   }
// }

// final detailViewModel =
//     NotifierProvider<DetailViewModel, MovieDetail?>(() => DetailViewModel());
