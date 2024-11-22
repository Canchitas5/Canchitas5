import 'package:canchitas/presentation/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  bool isLoggedIn = false; // Cambia este valor según el estado del usuario
  String? userName;
  String? userPhone;
  String? userAddress;

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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: isLoggedIn
            ? _buildProfileContent() // Contenido para usuarios logueados
            : _buildLoginButton(), // Botón de iniciar sesión
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
              child: Icon(Icons.person, color: Colors.grey[700]),
            ),
            title: Text(
              userName ?? 'Usuario',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            subtitle: Text(
                '${userAddress ?? "Sin dirección"}\n${userPhone ?? "Sin teléfono"}'),
            trailing: ElevatedButton(
              onPressed: () {
                // Agregar funcionalidad para editar
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
                  // Cambia entre reservas activas y anteriores
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
                  // Cambia entre reservas activas y anteriores
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

  Widget _buildLoginButton() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'No has iniciado sesión.',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navegar a la pantalla de login
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const LoginScreen(reservationDetails: {})),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Text(
              'Iniciar Sesión',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
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
