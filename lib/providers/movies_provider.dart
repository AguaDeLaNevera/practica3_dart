import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier{
  String _baseUrl = 'api.themoviededb.org';
  String _apiKey = '26b58aa103d32090e635bac29bc129fb';
  String _language = 'es-ES';
  String _page = '1';

  List<Movie> onDisplayMovie = [];

  MoviesProvider(){
    print('Movies provider inicialitzat!');
    this.getOnDisplayMovies();
  }
  getOnDisplayMovies() async{
    print('getOnDisplayMovies');
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
    'api_key': _apiKey,
    'language': _language,
    'page': _page
    });

  // Await the http get response, then decode the json-formatted response.
  final result = await http.get(url);
  final nowPlayingResponse = nowPlayingResponseFromJson(result.body);
  onDisplayMovie = nowPlayingResponse.results;
  }
}
