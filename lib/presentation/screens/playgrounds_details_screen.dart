import 'package:flutter/material.dart';
import 'package:canchitas/presentation/screens/auth/login_screen.dart';
import '../../../models/sport_place.dart';

class PlaygroundDetailScreen extends StatelessWidget {
  final SportPlace playground;

  const PlaygroundDetailScreen({super.key, required this.playground});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(playground.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              playground.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Horario: ${playground.sportType}'),
            const SizedBox(height: 8),
            Text(playground.description),
            const SizedBox(height: 8),
            Text('Dirección: ${playground.address}'),
            const SizedBox(height: 8),
            Text('Deporte: ${playground.sportType}'),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('Calificación: ${playground.rating}'),
                const Icon(Icons.star, color: Colors.yellow, size: 16),
              ],
            ),
            const SizedBox(height: 8),
            Text('Precio: \$${playground.price}'),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de inicio de sesión
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  const LoginScreen(), // Redirige al LoginScreen
                  ),
                );
              },
              child: const Text('Reservar'),
            ),
          ],
        ),
      ),
    );
  }
}
