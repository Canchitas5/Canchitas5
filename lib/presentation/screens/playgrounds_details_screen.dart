import 'package:flutter/material.dart';
import 'package:canchitas/presentation/screens/auth/login_screen.dart';
import '../../../models/sport_place.dart';

class PlaygroundDetailScreen extends StatelessWidget {
  final SportPlace playground;
  final bool isLoggedIn; // Indica si el usuario está logueado

  const PlaygroundDetailScreen({
    super.key,
    required this.playground,
    required this.isLoggedIn, // Recibe el estado de login
  });

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
                if (isLoggedIn) {
                  // Lógica para reservar la cancha si el usuario está logueado
                  _showReservationConfirmation(context);
                } else {
                  // Redirige al LoginScreen si no está logueado
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const LoginScreen(reservationDetails: {}),
                    ),
                  );
                }
              },
              child: Text(isLoggedIn ? 'Confirmar Reserva' : 'Reservar'),
            ),
          ],
        ),
      ),
    );
  }

  // Mostrar una confirmación de reserva
  void _showReservationConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reserva Exitosa'),
        content: const Text('¡Tu reserva ha sido confirmada!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
