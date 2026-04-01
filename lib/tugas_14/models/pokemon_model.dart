// To parse this JSON data, do
//
//     final modelPokemon = modelPokemonFromJson(jsonString);

import 'dart:convert';

ModelPokemon modelPokemonFromJson(String str) =>
    ModelPokemon.fromJson(json.decode(str));

String modelPokemonToJson(ModelPokemon data) => json.encode(data.toJson());

class ModelPokemon {
  int? count;
  String? next;
  dynamic previous;
  List<Result>? results;

  ModelPokemon({this.count, this.next, this.previous, this.results});

  factory ModelPokemon.fromJson(Map<String, dynamic> json) => ModelPokemon(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: json["results"] == null
        ? []
        : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": results == null
        ? []
        : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  String? name;
  String? url;

  Result({this.name, this.url});

  factory Result.fromJson(Map<String, dynamic> json) =>
      Result(name: json["name"], url: json["url"]);

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}
