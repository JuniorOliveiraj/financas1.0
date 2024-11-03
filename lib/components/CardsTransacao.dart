// ignore: file_names
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Cardstransacao extends StatelessWidget {
  const Cardstransacao(
      {super.key,
      required this.data,
      required this.titulo,
      required this.valor});
  final DateTime data;
  final String titulo;
  final double valor;

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  DateFormat('d/MM/y').format(data),
                      
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '-R\$$valor',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 228, 110, 70),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
