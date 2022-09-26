import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
      ),
      body: const Center(
        child: Text('Pagina1'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
    );
  }
}
