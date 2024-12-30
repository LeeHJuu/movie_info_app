import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/domain/entity/movie_detail.dart';
import 'package:movie_info_app/ui/providers.dart';

class DetailViewModel extends AutoDisposeFamilyNotifier<MovieDetail?, int> {
  @override
  MovieDetail? build(int id) {
    fetchMovieDetail(id);
    return null;
  }

  Future<void> fetchMovieDetail(int id) async {
    state = await ref.read(fetchMovieDetailUsecaseProvider).execute(id);
  }
}

final detailViewModel = NotifierProvider.autoDispose
    .family<DetailViewModel, MovieDetail?, int>(() => DetailViewModel());
