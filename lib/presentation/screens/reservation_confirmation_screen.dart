import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ReservationConfirmationScreen extends StatefulWidget {
  final String name;
  final String hours;
  final String address;
  final String sport;
  final String rating;
  final double price;

  const ReservationConfirmationScreen({
    super.key,
    required this.name,
    required this.hours,
    required this.address,
    required this.sport,
    required this.rating,
    required this.price,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ReservationConfirmationScreenState createState() =>
      _ReservationConfirmationScreenState();
}

class _ReservationConfirmationScreenState
    extends State<ReservationConfirmationScreen> {
  String? selectedPaymentMethod;
  String? selectedCardOption;
  List<String> savedCards = ['**** **** **** 1234', '**** **** **** 5678'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmar Reserva'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Horario: ${widget.hours}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Dirección: ${widget.address}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Deporte: ${widget.sport}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Row(
              children: [
                Text('Calificación: ${widget.rating}',
                    style: const TextStyle(fontSize: 18)),
                const Icon(Icons.star, color: Colors.yellow, size: 16),
              ],
            ),
            const SizedBox(height: 10),
            Text('Precio: ${widget.price}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),

            // Selector de Método de Pago
            const Text(
              'Método de Pago:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              hint: const Text("Selecciona un método de pago"),
              value: selectedPaymentMethod,
              items: <String>[
                'Tarjeta de Crédito',
                'Tarjeta de Débito',
                'Efectivo',
                'Transferencia Bancaria'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedPaymentMethod = newValue;
                  selectedCardOption =
                      null; // Resetear la opción de tarjeta si cambia el método de pago
                });
              },
            ),
            const SizedBox(height: 10),

            // Mostrar opciones adicionales para Tarjeta de Crédito o Débito
            if (selectedPaymentMethod == 'Tarjeta de Crédito' ||
                selectedPaymentMethod == 'Tarjeta de Débito') ...[
              DropdownButton<String>(
                hint: const Text("Selecciona o añade una tarjeta"),
                value: selectedCardOption,
                items: [
                  ...savedCards.map((card) => DropdownMenuItem<String>(
                        value: card,
                        child: Text("Usar $card"),
                      )),
                  const DropdownMenuItem<String>(
                    value: 'new_card',
                    child: Text("Añadir nueva tarjeta"),
                  ),
                ],
                onChanged: (newValue) {
                  setState(() {
                    selectedCardOption = newValue;
                  });
                  if (newValue == 'new_card') {
                    _addNewCard();
                  }
                },
              ),
            ],

            const Spacer(),

            // Botón de Mensajería con el Dueño
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()),
                );
              },
              child: const Text('Mensajería con el Dueño'),
            ),
            const SizedBox(height: 10),

            // Botón de Confirmación de Reserva
            ElevatedButton(
              onPressed: () {
                _showConfirmationDialog();
              },
              child: const Text('Confirmar Reserva'),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmación'),
        content: const Text('¿Está seguro de realizar la reserva?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Cerrar el diálogo
            style: TextButton.styleFrom(
              foregroundColor: Colors.red, // Color de texto en rojo
            ),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
              _confirmReservation(); // Confirmar la reserva
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, // Color de texto en blanco
              backgroundColor: Colors.purple, // Fondo morado
            ),
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  void _confirmReservation() {
    // Lógica para confirmar la reserva (podrías añadir una notificación o navegar a otra pantalla)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reserva confirmada con éxito')),
    );
    Navigator.pop(
        context); // Regresar a la pantalla anterior después de confirmar
  }

  void _addNewCard() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Añadir Nueva Tarjeta"),
          content:
              const Text("Funcionalidad para añadir una tarjeta nueva aquí."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }
}
