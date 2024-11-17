class SportPlace {
  final String name;
  final String description;
  final String address;
  final String sportType;
  final String schedule;
  final double rating;
  final double price;

  SportPlace({
    required this.name,
    required this.description,
    required this.address,
    required this.sportType,
    required this.schedule,
    required this.rating,
    required this.price,
  });

  factory SportPlace.fromJson(Map<String, dynamic> json) {
    return SportPlace(
      name: json['name'],
      description: json['description'],
      address: json['address'],
      sportType: json['sportType'],
      schedule: "9:00 AM - 9:00 PM", // Horario fijo por defecto
      rating: (1 + (5 - 1) * (json['id'] % 5) / 5)
          .toDouble(), // Calificación inventada
      price:
          (5 + (20 - 5) * (json['id'] % 5) / 5).toDouble(), // Precio inventado
    );
  }
}
