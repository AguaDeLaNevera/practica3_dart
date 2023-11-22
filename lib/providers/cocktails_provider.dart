import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class CocktailsProvider extends ChangeNotifier {
  List<Drink> onDisplayCocktail = [];
  List<Drink> onDisplayNoAlcohol = [];
  Map<int, List<Drink>> onDisplayRecommendations = {};

  CocktailsProvider() {
    print('cocktailsprovider here');
    this.getOnDisplayedCocktails();
    this.getOnDisplayedNoAlcoholCocktails();
  }

  getOnDisplayedCocktails() async {
    var url = Uri.https('www.thecocktaildb.com', '/api/json/v1/1/filter.php',
        {'a': 'Alcoholic'});

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);
    var jsonResponse = convert.jsonDecode(result.body) as Map<String, dynamic>;
    final cocktailResponse = CocktailResponse.fromJson(jsonResponse);

    onDisplayCocktail = cocktailResponse.drinks;
    notifyListeners();
  }

  getOnDisplayedNoAlcoholCocktails() async {
    var url = Uri.https('www.thecocktaildb.com', '/api/json/v1/1/filter.php',
        {'a': 'Non_Alcoholic'});

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);
    var jsonResponse = convert.jsonDecode(result.body) as Map<String, dynamic>;
    final cocktailResponse = CocktailResponse.fromJson(jsonResponse);

    onDisplayNoAlcohol = cocktailResponse.drinks;
    notifyListeners();
  }

  Future<List<Drink>> getOnDisplayedRecommendations(int id) async {
    var url = Uri.https('www.thecocktaildb.com', '/api/json/v1/1/filter.php',
        {'c': 'Ordinary_Drink'});

    final result = await http.get(url);
    var jsonResponse = convert.jsonDecode(result.body) as Map<String, dynamic>;
    final cocktailResponse = CocktailResponse.fromJson(jsonResponse);

    onDisplayRecommendations[id] = cocktailResponse.drinks;

    return cocktailResponse.drinks;
  }
}
