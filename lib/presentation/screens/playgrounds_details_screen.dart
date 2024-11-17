import 'package:flutter/material.dart';
import 'package:canchitas/presentation/screens/reservation_confirmation_screen.dart';
import '../../../models/sport_place.dart';

class PlaygroundDetailScreen extends StatelessWidget {
  final SportPlace playground; // Cambiar el tipo de datos a SportPlace

  const PlaygroundDetailScreen({super.key, required this.playground});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(playground.name), // Usamos la propiedad 'name' del SportPlace
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              playground.name, // Usamos la propiedad 'name' del SportPlace
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
                'Horario: ${playground.sportType}'), // Usamos 'sportType' para el horario (ajusta si es necesario)
            const SizedBox(height: 8),
            Text(playground.description), // Usamos 'description' del SportPlace
            const SizedBox(height: 8),
            Text(
                'Dirección: ${playground.address}'), // Usamos 'address' del SportPlace
            const SizedBox(height: 8),
            Text(
                'Deporte: ${playground.sportType}'), // Usamos 'sportType' para el deporte
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                    'Calificación: ${playground.rating}'), // Usamos 'capacity' como ejemplo de calificación
                const Icon(Icons.star,
                    color: Colors.yellow,
                    size: 16), // Puedes usar un ícono de estrella aquí
              ],
            ),
            const SizedBox(height: 8),
            Text(
                'Precio: \$${playground.price}'), // Usamos 'placeSize' como ejemplo de precio
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de confirmación de reserva con los detalles de la cancha
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReservationConfirmationScreen(
                      name: playground
                          .name, // Pasamos las propiedades del playground
                      hours:
                          "9:00 AM - 9:00 PM", // Ajusta la lógica de horarios si es necesario
                      address: playground.address,
                      sport: playground.sportType,
                      rating: playground.rating
                          .toString(), // Ajusta si tienes una calificación real
                      price:
                          playground.price, // Ajusta si tienes un precio real
                    ),
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
