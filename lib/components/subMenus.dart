import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Submenus extends StatefulWidget {
  const Submenus({super.key});

  @override
  State<Submenus> createState() => _SubmenusState();
}

class _SubmenusState extends State<Submenus> {
  final List<Map<String, String>> cardsMenu = [
    {"nome": "Send", "img": 'assets/images/svgs/Send.svg'},
    {"nome": "Request", "img": 'assets/images/svgs/Requist.svg'},
    {"nome": "E-Wallet", "img": 'assets/images/svgs/E-Wallet.svg'},
    {"nome": "More", "img": 'assets/images/svgs/More.svg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: cardsMenu.map((e) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                 '${e['img']}',
                  width: 80,
                  semanticsLabel: e['nome'],
                 // placeholderBuilder: (BuildContext context) => CircularProgressIndicator(),
                ),
                const SizedBox(height: 5),
                Text(
                  e['nome']!,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
