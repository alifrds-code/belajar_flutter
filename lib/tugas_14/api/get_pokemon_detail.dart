import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:belajar_flutter/tugas_14/models/pokemon_detail_model.dart';

Future<ModelPokemon> getPokemonDetail(String id) async {
  final response = await http.get(
    Uri.parse("https://pokeapi.co/api/v2/pokemon/$id/"),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    return ModelPokemon.fromJson(jsonResponse);
  } else {
    throw Exception("Gagal memuat detail Pokemon");
  }
}
