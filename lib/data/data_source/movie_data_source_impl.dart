import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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

  @override
  Future<List<MovieResponseDto>?> fetchNowPlayingMovies() async {
    final response = await _client.get(
      'https://api.themoviedb.org/3/movie/now_playing',
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
  Future<List<MovieResponseDto>?> fetchPopularMovies() async {
    final response = await _client.get(
      'https://api.themoviedb.org/3/movie/popular',
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
  Future<List<MovieResponseDto>?> fetchTopRatedMovies() async {
    final response = await _client.get(
      'https://api.themoviedb.org/3/movie/top_rated',
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
  Future<List<MovieResponseDto>?> fetchUpcomingMovies() async {
    final response = await _client.get(
      'https://api.themoviedb.org/3/movie/upcoming',
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
}
