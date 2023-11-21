import 'models.dart';

class Drink {
  String strDrink;
  String strDrinkThumb;
  String idDrink;

  Drink({
    required this.strDrink,
    required this.strDrinkThumb,
    required this.idDrink,
  });

  factory Drink.fromRawJson(String str) => Drink.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        strDrink: json["strDrink"],
        strDrinkThumb: json["strDrinkThumb"],
        idDrink: json["idDrink"],
      );

  Map<String, dynamic> toJson() => {
        "strDrink": strDrink,
        "strDrinkThumb": strDrinkThumb,
        "idDrink": idDrink,
      };
}
