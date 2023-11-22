import 'models.dart';

class Drink {
  String strDrink;
  String strDrinkThumb;
  String idDrink;

  // Constructor de la classe Drink
  Drink({
    required this.strDrink,
    required this.strDrinkThumb,
    required this.idDrink,
  });

  // Factoria per crear una instància de la classe Drink des de JSON
  factory Drink.fromRawJson(String str) => Drink.fromJson(json.decode(str));

  // Converteix l'objecte Drink a una cadena JSON
  String toRawJson() => json.encode(toJson());

  // Factoria per crear una instància de la classe Drink des de Map<String, dynamic>
  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        strDrink: json["strDrink"],
        strDrinkThumb: json["strDrinkThumb"],
        idDrink: json["idDrink"],
      );

  // Converteix l'objecte Drink a un Map<String, dynamic>
  Map<String, dynamic> toJson() => {
        "strDrink": strDrink,
        "strDrinkThumb": strDrinkThumb,
        "idDrink": idDrink,
      };
}
