import 'person.dart';
import 'sport_place.dart';

class Reservation {
  final int id;
  final String day;
  final String timeStart;
  final String timeEnd;
  final double price;
  final String status;
  final Person person;
  final SportPlace sportPlace;

  Reservation({
    required this.id,
    required this.day,
    required this.timeStart,
    required this.timeEnd,
    required this.price,
    required this.status,
    required this.person,
    required this.sportPlace,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      day: json['day'],
      timeStart: json['timeStart'],
      timeEnd: json['timeEnd'],
      price: json['price'].toDouble(),
      status: json['status'],
      person: Person.fromJson(json['person']),
      sportPlace: SportPlace.fromJson(json['sportPlace']),
    );
  }
}
