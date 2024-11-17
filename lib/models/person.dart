class Person {
  final int id;
  final String email;
  final String name;
  final String lastName;
  final String phone;

  Person({
    required this.id,
    required this.email,
    required this.name,
    required this.lastName,
    required this.phone,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      lastName: json['lastName'],
      phone: json['phone'],
    );
  }
}
