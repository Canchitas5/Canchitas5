import 'package:canchitas/screens/PlaygroundsScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Canchitas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/playgrounds',
      routes: {
        //'/': (context) => MyApp(),
        //'home': (context) => const HomeScreen(),
        '/playgrounds': (context) => PlaygroundsScreen(),
        //'/reservations': (context) => const ReservationsScreen(),
        //'/profile': (context) => const ProfileScreen(),
      },
    );
  }
}