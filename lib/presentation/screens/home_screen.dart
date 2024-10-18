import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Reservas Activas
            Text(
              'reservas activas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
              ),
              padding: const EdgeInsets.all(8.0),
              child: _buildCarousel(), // Carrusel de imágenes
            ),
            const SizedBox(height: 30),

            // Historial de reservas
            Row(
              children: [
                Text(
                  'historial de reservas',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
                const Spacer(),
                const Text(
                  '>>>',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
              ),
              padding: const EdgeInsets.all(8.0),
              child: _buildCarousel(), // Otro carrusel de imágenes
            ),
            const SizedBox(height: 30),

            // Texto de llamada a la acción
            const Spacer(),
            const Center(
              child: Text(
                '¡Reserva tu cancha favorita y disfruta de momentos inolvidables con tus amigos!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget para construir el carrusel
  Widget _buildCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: [
        // Imagen de la cancha de fútbol
        'https://clublawntennis.net.pe/assets/img/Servicios/canchas-futbol.jpg',
        'https://www.uandes.cl/wp-content/uploads/2024/03/WhatsApp-Image-2024-02-26-at-13.02.25-1.jpeg',
        'https://www.uandes.cl/wp-content/uploads/2019/05/MG_3618-e1557860511800.jpg',
        'https://uandes.cl/wp-content/uploads/2019/05/MG_3545-e1557860730360.jpg',
      ].map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  item,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: Homescreen()));
}
