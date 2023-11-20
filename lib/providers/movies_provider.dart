import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/models/now_playing_response.dart';
import 'package:movies_app/models/popular_response.dart';

import '../models/cast.dart';


class MoviesProvider extends ChangeNotifier{
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '26b58aa103d32090e635bac29bc129fb';
  String _language = 'es-ES';
  String _page = '1';

  List<Movie> onDisplayMovies = [];
  List<Movie> onPopular = [];

  Map<int, List <Cast>> casting = {};

  MoviesProvider() {
    print('Movies Provider inicialitzat!');
    this.getOnDisplayedMovies();
    this.getPopularMovies();
  }

  getOnDisplayedMovies() async {
    var url =
      Uri.https(_baseUrl, '/3/movie/now_playing', {
          'api_key': _apiKey,
          'language': _language,
          'page': _page
        });

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);
    var jsonResponse = convert.jsonDecode(result.body) as Map<String, dynamic>;
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonResponse);
    
    onDisplayMovies = nowPlayingResponse.Movies;
    notifyListeners();
  }

  getPopularMovies() async {
    var url =
      Uri.https(_baseUrl, '/3/movie/popular', {
          'api_key': _apiKey,
          'language': _language,
          'page': _page
        });

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);
    var jsonResponse = convert.jsonDecode(result.body) as Map<String, dynamic>;
    final nowPlayingResponse = PopularResponse.fromMap(jsonResponse);
    

    onPopular = nowPlayingResponse.Movies;
    notifyListeners();
  }

  Future <List <Cast>> getMovieCast(int id) async {
    var url =
      Uri.https(_baseUrl, '/3/movie/$id/credits', {
          'api_key': _apiKey,
          'language': _language,
        });

    final result = await http.get(url);
    final castingInfo = CreditsResponse.fromJson(result.body);
    

    casting[id] = castingInfo.cast;

    return castingInfo.cast;
  }

}