// ignore: file_names
import 'package:flutter/material.dart';

class AdicionarGastosForm extends StatefulWidget {
  const AdicionarGastosForm(this.adicionarTransacao, {super.key});

  final void Function(String, double) adicionarTransacao;

  @override
  State<AdicionarGastosForm> createState() => _AdicionarGastosFormState();
}

class _AdicionarGastosFormState extends State<AdicionarGastosForm> {
  final valueController = TextEditingController();

  final titleValueController = TextEditingController();
  // ignore: non_constant_identifier_names
  _OnSubmit() {
    final title = titleValueController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    if (title.isNotEmpty && value > 0) {
      widget.adicionarTransacao(title, value);
      titleValueController.clear();
      valueController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Text(
            'Adicionar Gastos!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: titleValueController,
                decoration: const InputDecoration(labelText: 'Título'),
                onSubmitted: (value) => _OnSubmit,
              ),
              TextField(
                controller: valueController,
                decoration: const InputDecoration(labelText: 'Valor (R\$)'),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _OnSubmit,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 18),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      final title = titleValueController.text;
                      final value =
                          double.tryParse(valueController.text) ?? 0.0;
                      if (title.isNotEmpty && value > 0) {
                        widget.adicionarTransacao(title, value);
                        // Opcional: Limpar os campos após adicionar
                        titleValueController.clear();
                        valueController.clear();
                      }
                    },
                    child: const Text('Adicionar'),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
