import 'package:flutter/material.dart';

class PlaygroundsScreen extends StatelessWidget {
  const PlaygroundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playgrounds'),
      ),
      body: const Center(
        child: Text('Playgrounds Screen'),
      ),
    );
  }
}
