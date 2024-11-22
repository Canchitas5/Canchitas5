import 'package:canchitas/presentation/screens/home_screen.dart';
import 'package:canchitas/presentation/screens/playgrounds_screen.dart';
import 'package:canchitas/presentation/screens/profile_screen.dart';
import 'package:canchitas/presentation/screens/reservations_screen.dart';
import 'package:canchitas/presentation/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

class NavbarRoots extends StatefulWidget {
  const NavbarRoots({super.key});

  @override
  State<NavbarRoots> createState() => _NavbarRootsState();
}

class _NavbarRootsState extends State<NavbarRoots> {
  int _selectedIndex = 0;
  String? _userName;
  String? _userPhone;
  String? _userAddress;

  // Método para manejar la actualización de datos del usuario
  void _handleLogin() async {
    final userData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(reservationDetails: {}),
      ),
    );

    if (userData != null) {
      setState(() {
        _userName = userData['name'];
        _userPhone = userData['phone'];
        _userAddress = userData['address'];
        _selectedIndex = 3; // Cambiar a la pestaña de perfil después del login
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      const Homescreen(),
      const PlaygroundsScreen(),
      const ReservationsScreen(),
      // Mostrar la pantalla de perfil o un botón de login si no hay datos de usuario
      _userName != null
          ? ProfileScreen(
              userName: _userName!,
              userPhone: _userPhone!,
              userAddress: _userAddress!,
            )
          : Center(
              child: ElevatedButton(
                onPressed: _handleLogin,
                child: const Text('Iniciar Sesión'),
              ),
            ),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;

            // Si selecciona el perfil y no está logueado, mostrar pantalla de login
            if (_selectedIndex == 3 && _userName == null) {
              _handleLogin();
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Playgrounds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Reservations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
