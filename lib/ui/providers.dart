import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/data/data_source/movie_data_source.dart';
import 'package:movie_info_app/data/data_source/movie_data_source_impl.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';
import 'package:movie_info_app/domain/repository/movie_repository_impl.dart';
import 'package:movie_info_app/domain/usecase/fetch_movie_detail_usecase.dart';
import 'package:movie_info_app/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:movie_info_app/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:movie_info_app/domain/usecase/fetch_top_rate_movies_usecase.dart';
import 'package:movie_info_app/domain/usecase/fetch_upcoming_movies_usecase.dart';

final _movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  return MovieDataSourceImpl();
});

final _movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dataSource = ref.read(_movieDataSourceProvider);
  return MovieRepositoryImpl(dataSource);
});


final fetchMovieDetailUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_movieRepositoryProvider);
  return FetchMovieDetailUsecase(movieRepo);
});

final fetchNowPlayingMoviesUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_movieRepositoryProvider);
  return FetchNowPlayingMoviesUsecase(movieRepo);
});

final fetchPopularMoviesUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_movieRepositoryProvider);
  return FetchPopularMoviesUsecase(movieRepo);
});

final fetchTopRateMoviesUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_movieRepositoryProvider);
  return FetchTopRateMoviesUsecase(movieRepo);
});

final fetchUpcomingMoviesUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_movieRepositoryProvider);
  return FetchUpcomingMoviesUsecase(movieRepo);
});
