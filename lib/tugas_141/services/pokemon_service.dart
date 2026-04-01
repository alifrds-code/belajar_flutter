import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/model_pokemon.dart';

class PokemonService {
  static const String baseUrl = 'https://pokeapi.co/api/v2';

  static Future<Pokemon> getPokemon(String nameOrId) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon/$nameOrId'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Pokemon.fromJson(json);
    } else {
      throw Exception('Pokemon tidak ditemukan');
    }
  }
}
