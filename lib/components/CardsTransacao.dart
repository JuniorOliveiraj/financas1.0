// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Cardstransacao extends StatelessWidget {
  const Cardstransacao({
    super.key,
    required this.data,
    required this.titulo,
    required this.valor,
    required this.avatarImage,
  });

  final DateTime data;
  final String titulo;
  final double valor;
  final String avatarImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Container(
                      child: avatarImage.endsWith('.svg')
                      ? SvgPicture.network(
                          avatarImage,
                          width: 30,
                          height: 30,
                          semanticsLabel: "Imagem do avatar",
                          placeholderBuilder: (BuildContext context) =>
                              const CircularProgressIndicator(),
                        )
                      : Image.network(
                          avatarImage,
                          width: 30,
                          height: 30,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        ),
                  ),
                ),
                const SizedBox(
                    width: 10), // Espaçamento entre a imagem e o texto
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
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '-R\$${valor.toStringAsFixed(2)}',
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
