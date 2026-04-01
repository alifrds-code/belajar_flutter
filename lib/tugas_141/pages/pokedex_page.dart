import 'package:flutter/material.dart';
import '../services/pokemon_service.dart';
import '../models/model_pokemon.dart';
import 'pokemon_detail_page.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _pokemonList = [];
  List<String> _filteredList = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadPokemonList();
  }

  Future<void> _loadPokemonList() async {
    setState(() => _isLoading = true);
    try {
      // Ambil 151 pokemon pertama
      for (int i = 1; i <= 151; i++) {
        final pokemon = await PokemonService.getPokemon(i.toString());
        _pokemonList.add(pokemon.name);
      }
      setState(() {
        _filteredList = List.from(_pokemonList);
      });
    } catch (e) {
      setState(() {
        _filteredList = [];
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _filterPokemon(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredList = List.from(_pokemonList);
      } else {
        _filteredList = _pokemonList
            .where((name) => name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFDE00), // kuning khas pokemon
      appBar: AppBar(
        backgroundColor: const Color(0xFFCC0000), // merah khas pokemon
        elevation: 4,
        title: Row(
          children: [
            // Ganti dengan logo pokemon jika sudah ada, sementara pakai icon
            Icon(Icons.catching_pokemon, color: Colors.yellow[200], size: 32),
            const SizedBox(width: 12),
            Text(
              'Pokedex',
              style: TextStyle(
                fontFamily: 'GalaferaMedium', // font custom jika sudah diatur di pubspec
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white,
                letterSpacing: 2,
                shadows: [
                  Shadow(
                    blurRadius: 6,
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterPokemon,
              style: const TextStyle(
                fontFamily: 'GalaferaMedium',
                fontSize: 18,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Cari Pokemon...',
                prefixIcon: const Icon(Icons.search, color: Color(0xFFCC0000)),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredList.isEmpty
                ? const Center(child: Text('Tidak ada Pokemon'))
                : ListView.builder(
                    itemCount: _filteredList.length,
                    itemBuilder: (context, index) {
                      final name = _filteredList[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          border: Border.all(color: const Color(0xFFCC0000), width: 2),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.catching_pokemon, color: Colors.amber[700]),
                          title: Text(
                            name[0].toUpperCase() + name.substring(1),
                            style: const TextStyle(
                              fontFamily: 'GalaferaMedium',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFFCC0000),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PokemonDetailPage(name: name),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
