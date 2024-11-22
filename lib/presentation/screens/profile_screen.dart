import 'package:canchitas/presentation/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String userName;
  final String userPhone;
  final String userAddress;

  const ProfileScreen({
    super.key,
    required this.userName,
    required this.userPhone,
    required this.userAddress,
  });

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  void _logout() {
    // Navegar a la pantalla de login al cerrar sesión
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(reservationDetails: {}),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Perfil',
          style: TextStyle(color: Colors.teal),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            onPressed: _logout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: _buildProfileContent(),
      ),
    );
  }

  Widget _buildProfileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, color: Colors.teal),
            ),
            title: Text(
              widget.userName,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            subtitle: Text('${widget.userAddress}\n${widget.userPhone}'),
            trailing: ElevatedButton(
              onPressed: () {
                // Implementar funcionalidad de editar
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
                  // Implementar lógica para mostrar reservas activas
                });
              },
              child: const Text(
                'Reserva activa',
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // Implementar lógica para mostrar reservas anteriores
                });
              },
              child: const Text(
                'Reservas anteriores',
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const Divider(),
        const ReservationCard(),
      ],
    );
  }
}

class ReservationCard extends StatelessWidget {
  const ReservationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reserva activa: Cancha de fútbol',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Fecha: 28 de Julio del 2023'),
            Text('Horario: 11:00 AM - 12:00 PM'),
            SizedBox(height: 10),
            Text(
              'Total: S/ 110.00',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
