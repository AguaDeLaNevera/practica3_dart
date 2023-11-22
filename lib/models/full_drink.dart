import 'models.dart';

class FullDrink {
  int idDrink;
  String strDrink;
  String strDrinkAlternate;
  String strTags;
  String strVideo;
  String strCategory;
  String strIBA;
  String strAlcoholic;
  String strGlass;
  String strInstructions; 
  String strDrinkThumb;
  String strIngredient1; 
  String strIngredient2; 
  String strIngredient3; 
  String strImageSource;
  String strImageAttribution;

  FullDrink({
    required this.idDrink,
    required this.strDrink,
    required this.strDrinkAlternate,
    required this.strTags,
    required this.strVideo,
    required this.strCategory,
    required this.strIBA,
    required this.strAlcoholic,
    required this.strGlass,
    required this.strInstructions, 
    required this.strDrinkThumb,
    required this.strIngredient1, 
    required this.strIngredient2, 
    required this.strIngredient3, 
    required this.strImageSource,
    required this.strImageAttribution,
    
  });

  factory FullDrink.fromRawJson(String str) => FullDrink.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FullDrink.fromJson(Map<String, dynamic> json) => FullDrink(
          idDrink: json["idDrink"],
          strDrink: json["strDrink"],
          strDrinkAlternate: json["strDrinkAlternate"],
          strTags: json["strTags"],
          strVideo: json["strVideo"],
          strCategory: json["strCategory"],
          strIBA: json["strIBA"],
          strAlcoholic: json["strAlcoholic"],
          strGlass: json["strGlass"],
          strInstructions: json["strInstructions"], 
          strDrinkThumb: json["strDrinkThumb"],
          strIngredient1: json["strIngredient1"], 
          strIngredient2: json["strIngredient2"], 
          strIngredient3: json["strIngredient3"], 
          strImageSource: json["strImageSource"],
          strImageAttribution: json["strImageAttribution"],
      );

  Map<String, dynamic> toJson() => {
          "idDrink": idDrink,
          "strDrink": strDrink,
          "strDrinkAlternate": strDrinkAlternate,
          "strTags": strTags,
          "strVideo": strVideo,
          "strCategory": strCategory,
          "strIBA": strIBA,
          "strAlcoholic": strAlcoholic,
          "strGlass": strGlass,
          "strInstructions": strInstructions, 
          "strDrinkThumb": strDrinkThumb,
          "strIngredient1": strIngredient1, 
          "strIngredient2": strIngredient2, 
          "strIngredient3": strIngredient3, 
          "strImageSource": strImageSource,
          "strImageAttribution": strImageAttribution,
      };
}


