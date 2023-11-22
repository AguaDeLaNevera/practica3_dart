import 'models.dart';

class FullCocktailResponse {
  List<FullDrink> fullDrinks;

  // Constructor de la classe FullCocktailResponse
  FullCocktailResponse({
    required this.fullDrinks,
  });

  // Factoria per crear una instància de la classe FullCocktailResponse des de JSON
  factory FullCocktailResponse.fromRawJson(String str) =>
      FullCocktailResponse.fromJson(json.decode(str));

  // Converteix l'objecte FullCocktailResponse a una cadena JSON
  String toRawJson() => json.encode(toJson());

  // Factoria per crear una instància de la classe FullCocktailResponse des de Map<String, dynamic>
  factory FullCocktailResponse.fromJson(Map<String, dynamic> json) =>
      FullCocktailResponse(
        fullDrinks: List<FullDrink>.from(
            json["fullDrinks"].map((x) => FullDrink.fromJson(x))),
      );

  // Converteix l'objecte FullCocktailResponse a un Map<String, dynamic>
  Map<String, dynamic> toJson() => {
        "fullDrinks": List<dynamic>.from(fullDrinks.map((x) => x.toJson())),
      };
}
