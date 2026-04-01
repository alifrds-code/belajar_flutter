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

class Pokemon {
  final int id;
  final String name;
  final int height;
  final int weight;
  final List<String> types;
  final List<String> abilities;
  final String imageUrl;
  final Species species;

  Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.abilities,
    required this.imageUrl,
    required this.species,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      types: (json['types'] as List)
          .map((t) => t['type']['name'] as String)
          .toList(),
      abilities: (json['abilities'] as List)
          .map((a) => a['ability']['name'] as String)
          .toList(),
      imageUrl:
          json['sprites']?['other']?['official-artwork']?['front_default'] ??
          '',
      species: Species.fromJson(json['species']),
    );
  }
}

class Species {
  final String name;
  final String url;
  Species({required this.name, required this.url});
  factory Species.fromJson(Map<String, dynamic> json) =>
      Species(name: json['name'] ?? '', url: json['url'] ?? '');
}
