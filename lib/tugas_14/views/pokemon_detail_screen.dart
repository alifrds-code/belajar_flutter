import 'package:flutter/material.dart';
import 'package:belajar_flutter/tugas_14/api/get_pokemon_detail.dart';
import 'package:belajar_flutter/tugas_14/models/pokemon_detail_model.dart';

class PokemonDetailScreen extends StatelessWidget {
  final String pokemonId;
  final String pokemonName;
  final String imageUrl;

  const PokemonDetailScreen({
    super.key,
    required this.pokemonId,
    required this.pokemonName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          pokemonName.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<ModelPokemon>(
        future: getPokemonDetail(pokemonId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final detail = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Hero(
                      tag: pokemonId,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.network(imageUrl, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Text(
                    "#$pokemonId - ${pokemonName.toUpperCase()}",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: detail.types!.map((t) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.redAccent),
                        ),
                        child: Text(
                          t.type!.name!.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatCard("Tinggi", "${detail.height! / 10} M"),
                      _buildStatCard("Berat", "${detail.weight! / 10} KG"),
                      _buildStatCard("Base EXP", "${detail.baseExperience}"),
                    ],
                  ),
                  const SizedBox(height: 30),

                  const Text(
                    "ABILITIES",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 8,
                    children: detail.abilities!.map((a) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          a.ability!.name!.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 30),

                  const Text(
                    "BASE STATS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: detail.stats!.map((s) {
                        Color statColor = Colors.redAccent;
                        if (s.baseStat! > 80)
                          statColor = Colors.green;
                        else if (s.baseStat! > 50)
                          statColor = Colors.orange;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  _formatStatName(s.stat!.name!),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 35,
                                child: Text(
                                  s.baseStat.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: LinearProgressIndicator(
                                    value: s.baseStat! / 200,
                                    minHeight: 10,
                                    backgroundColor: Colors.grey[200],
                                    color: statColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            );
          }
          return const Center(child: Text("Data Kosong"));
        },
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  String _formatStatName(String name) {
    switch (name) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'ATTACK';
      case 'defense':
        return 'DEFENSE';
      case 'special-attack':
        return 'SP. ATK';
      case 'special-defense':
        return 'SP. DEF';
      case 'speed':
        return 'SPEED';
      default:
        return name.toUpperCase();
    }
  }
}
