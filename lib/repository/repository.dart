import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import '../api/tmdb_client.dart';
import '../models/movie_model.dart';
import '../utils/app_error.dart';
import '../utils/trend_type.dart';


abstract class Repository {
  Future<Either<AppError, List<MovieModel>>> getMovies(TrendType type);
}

class RepositoryImpl implements Repository {
  final Dio client;

  RepositoryImpl(this.client);

  @override
  Future<Either<AppError, List<MovieModel>>> getMovies(TrendType type) async {
    try {
      final response = await TmdbClient(client)
          .getResponse(path: 'movie/${type.value}', params: {});
      final movies = MovieResults.fromJson(response.data).movies;
      return right(movies ?? []);
    } on DioError catch (e) {
      AppError error = const AppError().handleError(e);
      return left(error);
    }
  }
}