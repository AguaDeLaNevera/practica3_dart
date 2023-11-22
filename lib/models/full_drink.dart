import 'models.dart';

class FullDrink {
  String idDrink;
  String strInstructions;
  String strIngredient1;
  String strIngredient2;
  String strIngredient3;

  // Constructor de la classe FullDrink
  FullDrink({
    required this.idDrink,
    required this.strInstructions,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
  });

  // Factoria per crear una instància de la classe FullDrink des de JSON
  factory FullDrink.fromRawJson(String str) =>
      FullDrink.fromJson(json.decode(str));

  // Converteix l'objecte FullDrink a una cadena JSON
  String toRawJson() => json.encode(toJson());

  // Factoria per crear una instància de la classe FullDrink des de Map<String, dynamic>
  factory FullDrink.fromJson(Map<String, dynamic> json) => FullDrink(
        idDrink: json["idDrink"],
        strInstructions: json["strInstructions"],
        strIngredient1: json["strIngredient1"],
        strIngredient2: json["strIngredient2"],
        strIngredient3: json["strIngredient3"],
      );

  // Converteix l'objecte FullDrink a un Map<String, dynamic>
  Map<String, dynamic> toJson() => {
        "idDrink": idDrink,
        "strInstructions": strInstructions,
        "strIngredient1": strIngredient1,
        "strIngredient2": strIngredient2,
        "strIngredient3": strIngredient3,
      };
}
