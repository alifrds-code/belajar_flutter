import 'package:flutter/material.dart';

class EvolutionPage extends StatelessWidget {
  final String speciesUrl;
  const EvolutionPage({Key? key, required this.speciesUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Evolution Chain')),
      body: Center(child: Text('Evolution chain for:\n$speciesUrl')),
    );
  }
}
