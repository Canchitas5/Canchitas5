import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.grade),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grade),
          label: 'Canchitas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grade),
          label: 'Slot3',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grade),
          label: 'Slot4',
        ),
      ],
      currentIndex: _getSelectedIndex(context),
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.black,
      onTap: (index) {
        _onItemTapped(index, context);
      },
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final route = ModalRoute.of(context)?.settings.name;
    switch (route) {
      case '/':
        return 0;
      case '/':
        return 1;
      case '/':
        return 2;
      case '/':
        return 3;
      default:
        return 0;
    }
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/');
        break;
    }
  }
}