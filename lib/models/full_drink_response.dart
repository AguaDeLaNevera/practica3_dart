import 'models.dart';

class FullDrinkResponse {
  List<FullDrink> drinks;

  FullDrinkResponse({
    required this.drinks,
  });

  factory FullDrinkResponse.fromRawJson(String str) =>
      FullDrinkResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
  factory FullDrinkResponse.fromJson(Map<String, dynamic> json) =>
      FullDrinkResponse(
        drinks: List<FullDrink>.from(json["drinks"].map((x) => FullDrink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}
