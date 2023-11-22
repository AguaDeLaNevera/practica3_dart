import 'dart:convert';
import 'models.dart';

class CocktailResponse {
  List<Drink> drinks;

  // Constructor de la classe CocktailResponse
  CocktailResponse({
    required this.drinks,
  });

  // Factoria per crear una instància de la classe CocktailResponse des de JSON
  factory CocktailResponse.fromRawJson(String str) =>
      CocktailResponse.fromJson(json.decode(str));

  // Converteix l'objecte CocktailResponse a una cadena JSON
  String toRawJson() => json.encode(toJson());

  // Factoria per crear una instància de la classe CocktailResponse des de Map<String, dynamic>
  factory CocktailResponse.fromJson(Map<String, dynamic> json) =>
      CocktailResponse(
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
      );

  // Converteix l'objecte CocktailResponse a un Map<String, dynamic>
  Map<String, dynamic> toJson() => {
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}
