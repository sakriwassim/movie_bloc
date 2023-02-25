import 'dart:convert';
import '../domain/movie_api.dart';

class MoviesWebServices {
  Future<List<dynamic>> getAllMovies() async {
    try {
      final String response = await MovieAPI.index();
      final data = await json.decode(response);
      return data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
