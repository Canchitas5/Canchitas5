import '../models/person.dart';
import '../models/sport_place.dart';
import '../models/reservation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl =
      'https://canchitas-webservice-production.up.railway.app/api/v1';

  // Método para obtener los lugares deportivos
  Future<List<SportPlace>> fetchSportPlaces() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/sportPlaces'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => SportPlace.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load sport places');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Método para obtener las reservaciones
  Future<List<Reservation>> fetchReservations() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/reservation'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => Reservation.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load reservations');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
