import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showActiveReservation = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.logout, color: Colors.red),
              onPressed: () {
                // Add logout functionality
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, color: Colors.grey[700]),
                ),
                title: const Text(
                  'Mario Salvatierra',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                ),
                subtitle: const Text('Chorrillos\n920032515'),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Add edit functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Editar'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      showActiveReservation = true;
                    });
                  },
                  child: Text(
                    'Reserva activa',
                    style: TextStyle(
                      color: showActiveReservation ? Colors.teal : Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      showActiveReservation = false;
                    });
                  },
                  child: Text(
                    'Reservas anteriores',
                    style: TextStyle(
                      color: showActiveReservation ? Colors.grey : Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            if (showActiveReservation)
            // Active Reservation Content
              ReservationCard(),
            if (!showActiveReservation)
            // Previous Reservations Content (showing same info for now)
              ReservationCard(),
          ],
        ),
      ),
    );
  }
}

class ReservationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: const Text(
                    'RESERVA: #3835 - 28 de Julio del 2023\nPRUEBA 512 MIGUEL - Futbol',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('En proceso'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Proveedor: PRUEBA 512 MIGUEL'),
            const Text('Cancha: Futbol'),
            const Text('Deporte: Fútbol'),
            const Text('Tamaño de cancha deportiva: 11 vs 11'),
            const Text('Dirección: AV. calle 23, san borja'),
            const Text('Fecha: 28 de Julio del 2023'),
            const Text('Horario de reserva: de 11:00 a 11:59 hrs'),
            const SizedBox(height: 10),
            const Text(
              'Total a pagar: S/ 110.00',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('Por pagar: S/ 100.00'),
            const Text('Pagado: S/ 10.00'),
            const SizedBox(height: 10),
            const Text('MÉTODO DE PAGO: App'),
          ],
        ),
      ),
    );
  }
}
