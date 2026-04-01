import 'dart:async';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/tugas_14/api/get_pokemon.dart';
import 'package:belajar_flutter/tugas_14/models/pokemon_model.dart';
import 'package:belajar_flutter/tugas_14/views/pokemon_detail_screen.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  List<Result> _allPokemon = [];
  List<Result> _filteredPokemon = [];

  String _sortOrder = 'id';
  final TextEditingController _searchController = TextEditingController();

  Timer? _debounce;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> _fetchData() async {
    try {
      final newData = await getPokemon();
      setState(() {
        _allPokemon = newData;
        _applyFilterAndSort();
      });
    } catch (e) {
      debugPrint("Error Fetching Data: $e");
    }
  }

  Future<void> _refreshData() async {
    setState(() {
      _allPokemon.clear();
      _filteredPokemon.clear();
      _searchController.clear();
      _sortOrder = 'id';
    });
    await _fetchData();
  }

  void _applyFilterAndSort() {
    List<Result> results = [];
    String query = _searchController.text.toLowerCase();

    if (query.isEmpty) {
      results = List.from(_allPokemon);
    } else {
      results = _allPokemon
          .where((pokemon) => pokemon.name!.toLowerCase().contains(query))
          .toList();
    }

    if (_sortOrder == 'az') {
      results.sort((a, b) => a.name!.compareTo(b.name!));
    } else if (_sortOrder == 'za') {
      results.sort((a, b) => b.name!.compareTo(a.name!));
    } else {
      results.sort((a, b) {
        int idA = int.parse(a.url!.split('/')[a.url!.split('/').length - 2]);
        int idB = int.parse(b.url!.split('/')[b.url!.split('/').length - 2]);
        return idA.compareTo(idB);
      });
    }

    setState(() {
      _filteredPokemon = results;
    });
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _applyFilterAndSort();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Pokedex API',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                    decoration: InputDecoration(
                      hintText: 'Cari Pokemon...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: PopupMenuButton<String>(
                    icon: const Icon(Icons.sort, color: Colors.white),
                    tooltip: "Urutkan",
                    onSelected: (value) {
                      setState(() {
                        _sortOrder = value;
                      });
                      _applyFilterAndSort();
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                        value: 'id',
                        child: Text('Default (ID)'),
                      ),
                      const PopupMenuItem(
                        value: 'az',
                        child: Text('Abjad (A - Z)'),
                      ),
                      const PopupMenuItem(
                        value: 'za',
                        child: Text('Abjad (Z - A)'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshData,
              child: _allPokemon.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Scrollbar(
                      controller: _scrollController,
                      interactive: true,
                      radius: const Radius.circular(8),
                      thickness: 6,
                      child: GridView.builder(
                        controller: _scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.85,
                            ),
                        itemCount: _filteredPokemon.length,
                        itemBuilder: (context, index) {
                          final item = _filteredPokemon[index];
                          final urlParts = item.url!.split('/');
                          final pokemonId = urlParts[urlParts.length - 2];
                          final imageUrl =
                              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$pokemonId.png";

                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PokemonDetailScreen(
                                    pokemonId: pokemonId,
                                    pokemonName: item.name!,
                                    imageUrl: imageUrl,
                                  ),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(16),
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Container(
                                    color: Colors.grey[100],
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Image.network(
                                        imageUrl,
                                        fit: BoxFit.contain,
                                        cacheWidth: 250,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const Icon(
                                                  Icons.broken_image,
                                                  size: 50,
                                                  color: Colors.grey,
                                                ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withOpacity(0.8),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        item.name!.toUpperCase(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
