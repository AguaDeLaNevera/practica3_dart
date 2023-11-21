import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class CocktailsProvider extends ChangeNotifier {
  String _baseUrl = 'www.thecocktaildb.com/api/json/v1';

  List<Drink> onDisplayCocktail = [];
  List<Drink> onDisplayNoAlcohol = [];

  CocktailsProvider() {
    print('Movies Provider inicialitzat!');
    this.getOnDisplayedCocktails();
    this.getOnDisplayedNoAlcoholCocktails();
  }

  getOnDisplayedCocktails() async {
    var url = Uri.https(_baseUrl, '/1/filter.php?a=Alcoholic');

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);
    var jsonResponse = convert.jsonDecode(result.body) as Map<String, dynamic>;
    final cocktailResponse = CocktailResponse.fromJson(jsonResponse);

    onDisplayCocktail = cocktailResponse.Drinks;
    notifyListeners();
  }

  getOnDisplayedNoAlcoholCocktails() async {
    var url = Uri.https(_baseUrl, '/1/filter.php?a=Non_Alcoholic');

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);
    var jsonResponse = convert.jsonDecode(result.body) as Map<String, dynamic>;
    final nowPlayingResponse = PopularResponse.fromMap(jsonResponse);

    onDisplayNoAlcohol = nowPlayingResponse.Movies;
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int id) async {
    var url = Uri.https(_baseUrl, '/3/movie/$id/credits', {
      'api_key': _apiKey,
    });

    final result = await http.get(url);
    final castingInfo = CreditsResponse.fromJson(result.body);

    casting[id] = castingInfo.cast;

    return castingInfo.cast;
  }
}
