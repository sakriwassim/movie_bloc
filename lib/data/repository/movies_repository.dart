import '../models/movies.dart';
import '../web_services/movies_web_services.dart';

class MoviesRepository {
  final MoviesWebServices moviesWebServices;
  MoviesRepository(this.moviesWebServices);

  Future<List<Movie>> getAllMovies() async {
    final movies = await moviesWebServices.getAllMovies();
    List<Movie> listofmovies =
        movies.map((movies) => Movie.fromJson(movies)).toList();
    return listofmovies;
  }
}
