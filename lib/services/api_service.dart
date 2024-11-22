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

  // Método para realizar el login
  Future<dynamic> loginUser(
      String email, String password, String typeUser) async {
    try {
      final Uri uri = Uri.parse('$baseUrl/user').replace(queryParameters: {
        'email': email,
        'password': password,
        'typeUser': typeUser,
      });

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        // Verificar si la respuesta es una lista o un mapa
        final dynamic data = jsonDecode(response.body);
        if (data is List) {
          return data; // Devuelve la lista si es el caso
        } else if (data is Map) {
          return data; // Devuelve el mapa si es el caso
        } else {
          throw Exception("Formato de respuesta no reconocido");
        }
      } else if (response.statusCode == 401) {
        throw Exception('Credenciales incorrectas');
      } else {
        throw Exception('Failed to log in: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Método para realizar uN registro
  Future<Map<String, dynamic>> registerUser({
  required String email,
  required String password,
  required String typeUser,
  required String name,
  required String lastName,
  required String dni,
  required String phone,
  required String birthDate,
  required String picProfile,
}) async {
  try {
    final Uri uri = Uri.parse('$baseUrl/Person');

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "email": email,
        "password": password,
        "typeUser": 'person',
        "name": name,
        "lastName": lastName,
        "dni": dni,
        "phone": phone,
        "birthDate": birthDate,
        "picProfile": picProfile,
      }),
    );

    if (response.statusCode == 201) {
      // Registro exitoso
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      throw Exception('Datos inválidos. Verifica los campos.');
    } else {
      throw Exception('Error al registrar: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}

}
