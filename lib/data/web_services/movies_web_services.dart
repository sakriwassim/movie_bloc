import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../../constants/strings.dart';

class MoviesWebServices {
  Future<List<dynamic>> getAllMovies() async {
    try {
      final String response = await rootBundle.loadString('assets/movie.json');
      final data = await json.decode(response);
      return data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
