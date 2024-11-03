import 'package:corso_finacas/FormularioModal.dart';
import 'package:corso_finacas/ListCardsTRansicoes.dart';
import 'package:corso_finacas/components/grafico.dart';
import 'package:corso_finacas/components/subMenus.dart';
import 'package:corso_finacas/models/tranzacao.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fincas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Inter",

        //dialogBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Finanças'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _openModalForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return AdicionarGastosForm(_adicionarTransacao);
      },
    );
  }

  final List<Tranzacao> _transacoes = [
    Tranzacao(id: 1, titulo: 'Uber', valor: 100.00, data: DateTime.now()),
    Tranzacao(id: 1, titulo: 'Uber', valor: 50.00, data: DateTime.now()),
    Tranzacao(id: 1, titulo: 'Uber', valor: 10.50, data: DateTime.now()),
  ];

  void _adicionarTransacao(String titulo, double valor) {
    final novaTransacao = Tranzacao(
      id: DateTime.now().microsecondsSinceEpoch,
      titulo: titulo,
      valor: valor,
      data: DateTime.now(),
    );

    setState(() {
      _transacoes.add(novaTransacao);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor:const Color.fromARGB(255, 204, 255, 237),
        //Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GraficoCard(
              transacoes: _transacoes,
            ),
            const Submenus(),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.all(17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Activities",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.normal),
                      ),
                      Row(
                        children: [
                          Text(
                            "Today",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.normal),
                          ),
                          const Icon(Icons.arrow_drop_down_outlined, size: 30,)
                        ],
                      ),
                    ],
                  ),
                ),
                Listcardstransicoes(transacoes: _transacoes),
                const SizedBox(height: 10),
                //AdicionarGastosForm(_adicionarTransacao),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        onPressed: () => _openModalForm(context),
        tooltip: 'Adicionar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
