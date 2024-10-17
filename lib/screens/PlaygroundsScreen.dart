import 'package:flutter/material.dart';

import '../shared/NavBar.dart';

class PlaygroundsScreen extends StatefulWidget {
  @override
  _PlaygroundsScreenState createState() => _PlaygroundsScreenState();
}

class _PlaygroundsScreenState extends State<PlaygroundsScreen> {
  List<Map<String, dynamic>> playgrounds = [
    {
      'name': 'Cancha Los Olivos',
      'hours': '8:00 AM - 10:00 PM',
      'description': 'Césped sintético de alta calidad.',
      'rating': 4.5,
      'price': '\$20/hora',
    },
    {
      'name': 'Campo El Reto',
      'hours': '6:00 AM - 8:00 PM',
      'description': 'Espacio amplio con iluminación nocturna.',
      'rating': 4.7,
      'price': '\$15/hora',
    },
    {
      'name': 'Fut 5 La Redonda',
      'hours': '9:00 AM - 11:00 PM',
      'description': 'Cancha techada para fútbol 5.',
      'rating': 4.3,
      'price': '\$18/hora',
    },
    {
      'name': 'Arena Gol',
      'hours': '7:00 AM - 9:00 PM',
      'description': 'Arena blanca con excelente mantenimiento.',
      'rating': 4.8,
      'price': '\$22/hora',
    },
    {
      'name': 'Estadio Pequeño',
      'hours': '8:00 AM - 8:00 PM',
      'description': 'Perfecto para partidos entre amigos.',
      'rating': 4.6,
      'price': '\$25/hora',
    },
    {
      'name': 'Soccer City',
      'hours': '10:00 AM - 10:00 PM',
      'description': 'Ubicada en el centro de la ciudad.',
      'rating': 4.4,
      'price': '\$19/hora',
    },
    {
      'name': 'Futbolitos del Sur',
      'hours': '6:00 AM - 9:00 PM',
      'description': 'Cancha al aire libre con grama natural.',
      'rating': 4.9,
      'price': '\$23/hora',
    },
    {
      'name': 'Playfut Central',
      'hours': '7:00 AM - 11:00 PM',
      'description': 'Fútbol rápido con césped artificial.',
      'rating': 4.2,
      'price': '\$21/hora',
    },
    {
      'name': 'Deportiva 7',
      'hours': '9:00 AM - 8:00 PM',
      'description': 'Buena opción para equipos pequeños.',
      'rating': 4.1,
      'price': '\$16/hora',
    },
    {
      'name': 'Cancha Estrella',
      'hours': '8:00 AM - 10:00 PM',
      'description': 'Ideal para torneos locales.',
      'rating': 4.5,
      'price': '\$20/hora',
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredPlaygrounds = playgrounds
        .where((playground) => playground['name']
        .toLowerCase()
        .contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Canchas Deportivas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Buscar canchita',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPlaygrounds.length,
              itemBuilder: (context, index) {
                final playground = filteredPlaygrounds[index];
                return GestureDetector(
                  onTap: () {

                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            playground['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('Horario: ${playground['hours']}'),
                          SizedBox(height: 4),
                          Text(playground['description']),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Text('Calificación: ${playground['rating']}'),
                              Icon(Icons.star, color: Colors.yellow, size: 16),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text('Precio: ${playground['price']}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}