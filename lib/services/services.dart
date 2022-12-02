import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../data/movie_data.dart';

class UrlHandler{
  var log = Logger();
  String mainPath = 'https://api.themoviedb.org/3/movie/';
  String imagePath = 'https://image.tmdb.org/t/p/original';
  String apiKey = '?api_key=';
  String language = '&language=tr';
  Future<Movie> fetchMovie(int number) async {

    String url;
    url = formater(number);
    print(url);
    // /user/register
    var response = await http.get(
      Uri.parse(url),
      // headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  String formater(int number) {
    return '$mainPath$number$apiKey';
  }
}