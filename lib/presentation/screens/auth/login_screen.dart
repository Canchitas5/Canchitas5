import 'package:canchitas/presentation/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:canchitas/services/api_service.dart';
import 'package:canchitas/presentation/screens/reservation_confirmation_screen.dart';

class LoginScreen extends StatefulWidget {
  final Map<String, dynamic> reservationDetails;

  const LoginScreen({super.key, required this.reservationDetails});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService(); // Instancia del ApiService

  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        _showErrorDialog("Por favor, llena todos los campos.");
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final response = await _apiService.loginUser(email, password, "person");

      if (response is List && response.isNotEmpty) {
        // Inicio de sesión exitoso, redirige a la pantalla de reserva
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(
              reservationDetails: {
                'name': 'Cancha de Fútbol',
                'hours': "9:00 AM - 9:00 PM",
                'address': 'Calle Los Pinos 123',
                'sport': 'Fútbol',
                'rating': '4.5',
                'price': 50.0,
              },
            ),
          ),
        );
      } else if (response is Map && response.isNotEmpty) {
        // Inicio de sesión exitoso, redirige a la pantalla de reserva
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => ReservationConfirmationScreen(
              name: widget.reservationDetails['name'],
              hours: widget.reservationDetails['hours'],
              address: widget.reservationDetails['address'],
              sport: widget.reservationDetails['sport'],
              rating: widget.reservationDetails['rating'],
              price: widget.reservationDetails['price'],
            ),
          ),
        );
      } else {
        _showErrorDialog("Credenciales incorrectas o respuesta vacía.");
      }
    } catch (e) {
      _showErrorDialog("Error al iniciar sesión: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.sports_soccer,
                size: 100,
                color: Colors.green[700],
              ),
              const SizedBox(height: 20),
              Text(
                "Reservar Canchas",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Correo Electrónico",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.green[700]),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.green[700]),
                ),
              ),
              const SizedBox(height: 30),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: const Text(
                        "Iniciar Sesión",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()),
                  );
                },
                child: Text(
                  "¿No tienes una cuenta? Regístrate aquí",
                  style: TextStyle(color: Colors.green[700]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
