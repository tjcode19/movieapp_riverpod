import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../api/tmdb_client.dart';
import '../../models/movie_model.dart';
import '../../repository/repository.dart';
import '../../utils/app_error.dart';
import '../../utils/trend_type.dart';

part 'providers.g.dart';

@riverpod
Dio dio(DioRef ref) => Dio();

@riverpod
TmdbClient tmdbClient(TmdbClientRef ref) => TmdbClient(ref.watch(dioProvider));

@riverpod
Repository repository(RepositoryRef ref) =>
    RepositoryImpl(ref.watch(dioProvider));

@riverpod
Future<List<MovieModel>> getMovies(
    GetMoviesRef ref, TrendType type, BuildContext context) async {
  final Map<TrendType, List<MovieModel>> movies = {
    TrendType.popular: [],
    TrendType.topRated: [],
    TrendType.upcoming: [],
    TrendType.nowPlaying: [],
  };
  final repository = ref.watch(repositoryProvider);

  await repository.getMovies(type).then((response) {
    response.fold(
        (l) => const AppError().showSnackbar(
            SnackBar(content: Text('${l.message}')), context), (r) {
      movies[type] = r;
    });
  });
  return movies[type] ?? [];
}