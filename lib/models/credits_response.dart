import 'dart:convert';

import 'package:movies_app/models/cast.dart';
export 'package:movies_app/models/models.dart';

class CreditsResponse {
    int id;
    List<Cast> cast;

    CreditsResponse({
        required this.id,
        required this.cast,
    });

    factory CreditsResponse.fromJson(String str) => CreditsResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CreditsResponse.fromMap(Map<String, dynamic> json) => CreditsResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toMap())),
    };
}