import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../../constants/strings.dart';

class CharactersWebServices {
  Future<List<dynamic>> getAllCharacters() async {
    try {
      final String response = await rootBundle.loadString('assets/movie.json');
      final data = await json.decode(response);
      return data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  // Future<List<dynamic>> getCharacterQuotes(String charName) async {
  //   try {
  //     Response response =
  //         await dio.get('quote', queryParameters: {'author': charName});
  //     return response.data;
  //   } catch (e) {
  //     return [];
  //   }
  // }
}
