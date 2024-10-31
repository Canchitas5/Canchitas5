import 'package:flutter/material.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  static const List<Map<String, dynamic>> reservations = [
    {
      'playground': 'Cancha Los Olivos',
      'date': '2024-11-01',
      'time': '8:00 AM - 10:00 AM',
      'price': '\$40',
      'status': 'Finalizado',
    },
    {
      'playground': 'Campo El Reto',
      'date': '2024-10-25',
      'time': '6:00 AM - 8:00 AM',
      'price': '\$30',
      'status': 'Finalizado',
    },
    {
      'playground': 'Arena Gol',
      'date': '2024-10-20',
      'time': '7:00 AM - 9:00 AM',
      'price': '\$44',
      'status': 'Cancelado',
    },
    {
      'playground': 'Futbolitos del Sur',
      'date': '2024-09-15',
      'time': '6:00 PM - 8:00 PM',
      'price': '\$46',
      'status': 'Finalizado',
    },
    {
      'playground': 'Estadio Pequeño',
      'date': '2024-09-10',
      'time': '10:00 AM - 12:00 PM',
      'price': '\$50',
      'status': 'Finalizado',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Reservas'),
      ),
      body: ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          final reservation = reservations[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reservation['playground'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Fecha: ${reservation['date']}'),
                  const SizedBox(height: 4),
                  Text('Hora: ${reservation['time']}'),
                  const SizedBox(height: 4),
                  Text('Precio: ${reservation['price']}'),
                  const SizedBox(height: 4),
                  Text(
                    'Estado: ${reservation['status']}',
                    style: TextStyle(
                      color: reservation['status'] == 'Finalizado'
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}