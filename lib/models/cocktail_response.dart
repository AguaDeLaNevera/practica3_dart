import 'models.dart';

class CocktailResponse {
  List<Drink> drinks;

  CocktailResponse({
    required this.drinks,
  });

  factory CocktailResponse.fromRawJson(String str) =>
      CocktailResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
  factory CocktailResponse.fromJson(Map<String, dynamic> json) =>
      CocktailResponse(
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}
