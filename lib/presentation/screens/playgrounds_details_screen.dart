import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaygroundDetailScreen extends StatelessWidget {
  final Map<String, dynamic> playground;

  const PlaygroundDetailScreen({super.key, required this.playground});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(playground['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              playground['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Horario: ${playground['hours']}'),
            const SizedBox(height: 8),
            Text(playground['description']),
            const SizedBox(height: 8),
            Text('Dirección: ${playground['address']}'),
            const SizedBox(height: 8),
            Text('Deporte: ${playground['sport']}'),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('Calificación: ${playground['rating']}'),
                const Icon(Icons.star, color: Colors.yellow, size: 16),
              ],
            ),
            const SizedBox(height: 8),
            Text('Precio: ${playground['price']}'),
            const Spacer(),
            ElevatedButton(
              onPressed: () {

              },
              child: const Text('Reservar'),
            ),
          ],
        ),
      ),
    );
  }
}