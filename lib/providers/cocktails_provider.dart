import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

// Proveïdor que gestiona les dades de les begudes
class CocktailsProvider extends ChangeNotifier {
  // Llista de begudes alcohòliques en exhibició
  List<Drink> onDisplayCocktail = [];

  // Llista de begudes no alcohòliques en exhibició
  List<Drink> onDisplayNoAlcohol = [];

  // Mapa que emmagatzema les recomanacions de begudes per a cada beguda
  Map<int, List<Drink>> onDisplayRecommendations = {};

  Map<int, FullDrink> detallsBeguda = {};

  // Constructor del proveïdor
  CocktailsProvider() {
    // Inicialitza la càrrega de begudes alcohòliques i no alcohòliques al moment de la creació
    this.getOnDisplayedCocktails();
    this.getOnDisplayedNoAlcoholCocktails();
  }

  // Obté i carrega les begudes alcohòliques en exhibició
  getOnDisplayedCocktails() async {
    var url = Uri.https('www.thecocktaildb.com', '/api/json/v1/1/filter.php',
        {'a': 'Alcoholic'});

    final result = await http.get(url);
    var jsonResponse = convert.jsonDecode(result.body) as Map<String, dynamic>;
    final cocktailResponse = CocktailResponse.fromJson(jsonResponse);

    // Actualitza la llista de begudes alcohòliques i notifica els widgets
    onDisplayCocktail = cocktailResponse.drinks;
    notifyListeners();
  }

  // Obté i carrega les begudes no alcohòliques en exhibició
  getOnDisplayedNoAlcoholCocktails() async {
    var url = Uri.https('www.thecocktaildb.com', '/api/json/v1/1/filter.php',
        {'a': 'Non_Alcoholic'});

    final result = await http.get(url);
    var jsonResponse = convert.jsonDecode(result.body) as Map<String, dynamic>;
    final cocktailResponse = CocktailResponse.fromJson(jsonResponse);

    // Actualitza la llista de begudes no alcohòliques i notifica els widgets
    onDisplayNoAlcohol = cocktailResponse.drinks;
    notifyListeners();
  }

  // Obté les recomanacions de begudes per a una beguda específica
  Future<List<Drink>> getOnDisplayedRecommendations(int id) async {
    var url = Uri.https('www.thecocktaildb.com', '/api/json/v1/1/filter.php',
        {'c': 'Ordinary_Drink'});

    final result = await http.get(url);
    var jsonResponse = convert.jsonDecode(result.body) as Map<String, dynamic>;
    final cocktailResponse = CocktailResponse.fromJson(jsonResponse);

    // Emmagatzema les recomanacions per a la beguda específica i retorna la llista
    onDisplayRecommendations[id] = cocktailResponse.drinks;
    return cocktailResponse.drinks;
  }

  Future<void> getDetallsBeguda(int id) async {
    var url = Uri.https(
        'www.thecocktaildb.com', '/api/json/v1/1/lookup.php', {'i': id});

    final result = await http.get(url);
    var jsonResponse = convert.jsonDecode(result.body) as Map<String, dynamic>;
    final fullCocktailResponse = FullCocktailResponse.fromJson(jsonResponse);

    detallsBeguda[id] = fullCocktailResponse.fullDrinks[1];
    notifyListeners();
  }
}
