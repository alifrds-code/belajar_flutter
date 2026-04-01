import 'package:flutter/material.dart';
import '../services/pokemon_service.dart';
import '../models/model_pokemon.dart';
import 'evolution_page.dart';

class PokemonDetailPage extends StatefulWidget {
  final String name;
  const PokemonDetailPage({Key? key, required this.name}) : super(key: key);

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late Future<Pokemon> _pokemonFuture;

  @override
  void initState() {
    super.initState();
    _pokemonFuture = PokemonService.getPokemon(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name[0].toUpperCase() + widget.name.substring(1)),
        centerTitle: true,
      ),
      body: FutureBuilder<Pokemon>(
        future: _pokemonFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('Pokemon tidak ditemukan'));
          }
          final pokemon = snapshot.data!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Image.network(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.id}.png',
                        height: 200,
                        width: 200,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.image_not_supported, size: 100),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EvolutionPage(speciesUrl: pokemon.species.url),
                        ),
                      );
                    },
                    icon: const Icon(Icons.auto_awesome),
                    label: const Text('Lihat Evolusi'),
                  ),
                  const SizedBox(height: 12),
                  _buildInfoCard('Height', '${pokemon.height / 10} m'),
                  _buildInfoCard('Weight', '${pokemon.weight / 10} kg'),
                  _buildInfoCard('Type', pokemon.types.join(', ')),
                  _buildInfoCard('Abilities', pokemon.abilities.join(', ')),
                  _buildInfoCard('Height', '${pokemon.height / 10} m'),
                  _buildInfoCard('Weight', '${pokemon.weight / 10} kg'),
                  _buildInfoCard('Type', pokemon.types.join(', ')),
                  _buildInfoCard('Abilities', pokemon.abilities.join(', ')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
