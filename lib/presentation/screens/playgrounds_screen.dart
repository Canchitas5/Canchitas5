import 'package:canchitas/presentation/screens/playgrounds_details_screen.dart';
import 'package:flutter/material.dart';
import '../../../models/sport_place.dart';
import '../../services/api_service.dart';

class PlaygroundsScreen extends StatefulWidget {
  const PlaygroundsScreen({super.key});

  @override
  _PlaygroundsScreenState createState() => _PlaygroundsScreenState();
}

class _PlaygroundsScreenState extends State<PlaygroundsScreen> {
  late ApiService apiService;
  List<SportPlace> sportPlaces = [];
  bool isLoading =
      true; // Para mostrar un indicador de carga mientras se obtienen los datos

  double startHour = 6.0; // Hora de inicio para el filtro
  double endHour = 23.0; // Hora de fin para el filtro

  bool isUserLoggedIn = false; // Define si el usuario está logueado

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    fetchSportPlaces();
    isUserLoggedIn = true; // Cambia según tu lógica real
  }

  Future<void> fetchSportPlaces() async {
    try {
      List<SportPlace> fetchedSportPlaces = await apiService.fetchSportPlaces();
      if (!mounted) return; // Verificar si el widget sigue montado
      setState(() {
        sportPlaces = fetchedSportPlaces;
        isLoading = false; // Ocultar el indicador de carga
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isLoading =
            false; // Ocultar el indicador de carga incluso si hay un error
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  bool isWithinHours(String availableHours) {
    final availableRange = availableHours.split(' - ');
    final availableStart = _parseTime(availableRange[0]);
    final availableEnd = _parseTime(availableRange[1]);

    final availableStartMinutes = timeOfDayToMinutes(availableStart);
    final availableEndMinutes = timeOfDayToMinutes(availableEnd);
    final userStartMinutes = (startHour * 60).toInt();
    final userEndMinutes = (endHour * 60).toInt();

    return (userEndMinutes >= availableStartMinutes &&
        userStartMinutes <= availableEndMinutes);
  }

  int timeOfDayToMinutes(TimeOfDay time) {
    return time.hour * 60 + time.minute;
  }

  TimeOfDay _parseTime(String time) {
    final format = time.contains('PM') && !time.contains('12') ? 12 : 0;
    final timeParts = time.replaceAll(RegExp(r'[ AMPMam]'), '').split(':');
    return TimeOfDay(
      hour: int.parse(timeParts[0]) + format,
      minute: int.parse(timeParts[1]),
    );
  }

  String formatHourLabel(double hour) {
    int hours = hour.toInt();
    String period = hours >= 12 ? 'PM' : 'AM';
    hours = hours > 12 ? hours - 12 : hours;
    return '${hours.toString().padLeft(2, '0')}:00 $period';
  }

  @override
  Widget build(BuildContext context) {
    List<SportPlace> filteredPlaygrounds = sportPlaces
        .where((playground) => isWithinHours(playground.schedule))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Canchas Deportivas'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Indicador de carga
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText:
                          'Buscar por nombre, dirección, precio o deporte',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      setState(() {
                        // Puedes implementar lógica de búsqueda aquí si es necesario
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Filtrar por horario de operación:',
                        style: TextStyle(fontSize: 16),
                      ),
                      RangeSlider(
                        values: RangeValues(startHour, endHour),
                        min: 6.0,
                        max: 23.0,
                        divisions: 17,
                        labels: RangeLabels(
                          formatHourLabel(startHour),
                          formatHourLabel(endHour),
                        ),
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
                              builder: (context) => PlaygroundDetailScreen(
                                  playground: playground, isLoggedIn: isUserLoggedIn,),
                            ),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  playground.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text('Horario: ${playground.schedule}'),
                                const SizedBox(height: 4),
                                Text(playground.description),
                                const SizedBox(height: 4),
                                Text('Dirección: ${playground.address}'),
                                const SizedBox(height: 4),
                                Text('Deporte: ${playground.sportType}'),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text('Calificación: ${playground.rating}'),
                                    const Icon(Icons.star,
                                        color: Colors.yellow, size: 16),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text('Precio: \$${playground.price}'),
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
