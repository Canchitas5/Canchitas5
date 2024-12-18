
import 'package:canchitas/presentation/widgets/navbar_roots.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Canchitas',
      home: NavbarRoots(),
    );
  }
}