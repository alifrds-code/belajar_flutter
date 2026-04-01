import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:belajar_flutter/tugas_14/models/pokemon_model.dart';

Future<List<Result>> getPokemon() async {
  final response = await http.get(
    Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=151"),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    final modelPokemon = ModelPokemon.fromJson(jsonResponse);
    return modelPokemon.results ?? [];
  } else {
    throw Exception("Gagal memuat data Pokemon");
  }
}
