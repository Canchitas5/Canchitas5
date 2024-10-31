import 'package:canchitas/presentation/screens/playgrounds_details_screen.dart';
import 'package:flutter/material.dart';

class PlaygroundsScreen extends StatefulWidget {
  const PlaygroundsScreen({super.key});

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
      'address': 'Av. Siempre Viva 742',
      'sport': 'Fútbol',
    },
    {
      'name': 'Campo El Reto',
      'hours': '6:00 AM - 8:00 PM',
      'description': 'Espacio amplio con iluminación nocturna.',
      'rating': 4.7,
      'price': '\$15/hora',
      'address': 'Calle Desafío 123',
      'sport': 'Fútbol',
    },
    {
      'name': 'Fut 5 La Redonda',
      'hours': '9:00 AM - 11:00 PM',
      'description': 'Cancha techada para fútbol 5.',
      'rating': 4.3,
      'price': '\$18/hora',
      'address': 'Plaza Fútbol 10',
      'sport': 'Fútbol 5',
    },
    {
      'name': 'Arena Gol',
      'hours': '7:00 AM - 9:00 PM',
      'description': 'Arena blanca con excelente mantenimiento.',
      'rating': 4.8,
      'price': '\$22/hora',
      'address': 'Camino Playa 45',
      'sport': 'Voleibol de Playa',
    },
    {
      'name': 'Estadio Pequeño',
      'hours': '8:00 AM - 8:00 PM',
      'description': 'Perfecto para partidos entre amigos.',
      'rating': 4.6,
      'price': '\$25/hora',
      'address': 'Calle del Estadio 1',
      'sport': 'Fútbol',
    },
    {
      'name': 'Soccer City',
      'hours': '10:00 AM - 10:00 PM',
      'description': 'Ubicada en el centro de la ciudad.',
      'rating': 4.4,
      'price': '\$19/hora',
      'address': 'Avenida Central 90',
      'sport': 'Fútbol',
    },
    {
      'name': 'Futbolitos del Sur',
      'hours': '6:00 AM - 9:00 PM',
      'description': 'Cancha al aire libre con grama natural.',
      'rating': 4.9,
      'price': '\$23/hora',
      'address': 'Calle Sur 23',
      'sport': 'Fútbol',
    },
    {
      'name': 'Playfut Central',
      'hours': '7:00 AM - 11:00 PM',
      'description': 'Fútbol rápido con césped artificial.',
      'rating': 4.2,
      'price': '\$21/hora',
      'address': 'Boulevard Central 77',
      'sport': 'Fútbol',
    },
    {
      'name': 'Deportiva 7',
      'hours': '9:00 AM - 8:00 PM',
      'description': 'Buena opción para equipos pequeños.',
      'rating': 4.1,
      'price': '\$16/hora',
      'address': 'Calle 7 Norte',
      'sport': 'Básquetbol',
    },
    {
      'name': 'Cancha Estrella',
      'hours': '8:00 AM - 10:00 PM',
      'description': 'Ideal para torneos locales.',
      'rating': 4.5,
      'price': '\$20/hora',
      'address': 'Avenida Estrella 200',
      'sport': 'Fútbol',
    },
  ];

  String searchQuery = '';
  double startHour = 6.0;
  double endHour = 23.0;

  bool isWithinHours(String availableHours, double userStartHour, double userEndHour) {
    final availableRange = availableHours.split(' - ');
    final availableStart = _parseTime(availableRange[0]);
    final availableEnd = _parseTime(availableRange[1]);

    final availableStartMinutes = timeOfDayToMinutes(availableStart);
    final availableEndMinutes = timeOfDayToMinutes(availableEnd);
    final userStartMinutes = (userStartHour * 60).toInt();
    final userEndMinutes = (userEndHour * 60).toInt();

    return (userEndMinutes >= availableStartMinutes && userStartMinutes <= availableEndMinutes);
  }

  int timeOfDayToMinutes(TimeOfDay time) {
    return time.hour * 60 + time.minute;
  }

  TimeOfDay _parseTime(String time) {
    final format = time.contains('PM') && !time.contains('12') ? 12 : 0;
    final timeParts = time.replaceAll(RegExp(r'[ AMPMam]'), '').split(':');
    return TimeOfDay(
        hour: int.parse(timeParts[0]) + format, minute: int.parse(timeParts[1]));
  }

  String formatHourLabel(double hour) {
    int hours = hour.toInt();
    String period = hours >= 12 ? 'PM' : 'AM';
    hours = hours > 12 ? hours - 12 : hours;
    return '${hours.toString().padLeft(2, '0')}:00 $period';
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredPlaygrounds = playgrounds
        .where((playground) =>
    (playground['name'].toLowerCase().contains(searchQuery.toLowerCase()) ||
        playground['address'].toLowerCase().contains(searchQuery.toLowerCase()) ||
        playground['price'].toLowerCase().contains(searchQuery.toLowerCase()) ||
        playground['sport'].toLowerCase().contains(searchQuery.toLowerCase())) &&
        isWithinHours(playground['hours'], startHour, endHour))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Canchas Deportivas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar por nombre, dirección, precio o deporte',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Filtrar por horario de operación:', style: TextStyle(fontSize: 16)),
                RangeSlider(
                  values: RangeValues(startHour, endHour),
                  min: 6.0,
                  max: 23.0,
                  divisions: 17,
                  labels: RangeLabels(formatHourLabel(startHour), formatHourLabel(endHour)),
                  onChanged: (RangeValues values) {
                    setState(() {
                      startHour = values.start;
                      endHour = values.end;
                    });
                  },
                ),
                Text(
                  'Desde: ${formatHourLabel(startHour)} hasta ${formatHourLabel(endHour)}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPlaygrounds.length,
              itemBuilder: (context, index) {
                final playground = filteredPlaygrounds[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlaygroundDetailScreen(playground: playground),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            playground['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text('Horario: ${playground['hours']}'),
                          const SizedBox(height: 4),
                          Text(playground['description']),
                          const SizedBox(height: 4),
                          Text('Dirección: ${playground['address']}'),
                          const SizedBox(height: 4),
                          Text('Deporte: ${playground['sport']}'),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text('Calificación: ${playground['rating']}'),
                              const Icon(Icons.star, color: Colors.yellow, size: 16),
                            ],
                          ),
                          const SizedBox(height: 4),
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
    );
  }
}
