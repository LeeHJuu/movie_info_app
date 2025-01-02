import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_info_app/api.dart';
import 'package:movie_info_app/data/data_source/movie_data_source.dart';
import 'package:movie_info_app/data/dto/movie_detail_dto.dart';
import 'package:movie_info_app/data/dto/movie_response_dto.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final Dio _client = Dio(BaseOptions(
    validateStatus: (status) => true,
    headers: {
      'accept': 'application/json',
      'Authorization': 'Bearer ${dotenv.get('API_TOKEN')}',
    },
    queryParameters: {
      'language': 'ko-KR',
    },
  ));

  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    final response =
        await _client.get('https://api.themoviedb.org/3/movie/$id');

    if (response.statusCode == 200) {
      final item = response.data;
      return MovieDetailDto.fromJson(item);
    }
  }

  Future<List<MovieResponseDto>?> _fetchMovieList(String url) async {
    final response = await _client.get(
      url,
      queryParameters: {
        'page': 1,
      },
    );
    if (response.statusCode == 200) {
      final items = response.data['results'];
      final list = List.from(items);

      return list.map((item) {
        return MovieResponseDto.fromJson(item);
      }).toList();
    }
    return [];
  }

  @override
  Future<List<MovieResponseDto>?> fetchNowPlayingMovies() async {
    return await _fetchMovieList(NOW_PLAYING_MOVIES_API);
  }

  @override
  Future<List<MovieResponseDto>?> fetchPopularMovies() async {
    return await _fetchMovieList(POPULAR_MOVIES_API);
  }

  @override
  Future<List<MovieResponseDto>?> fetchTopRatedMovies() async {
    return await _fetchMovieList(TOP_RATED_MOVIES_API);
  }

  @override
  Future<List<MovieResponseDto>?> fetchUpcomingMovies() async {
    return await _fetchMovieList(UPCOMING_MOVIES_API);
  }
}
