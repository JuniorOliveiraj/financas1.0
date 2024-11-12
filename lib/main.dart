import 'package:corso_finacas/FormularioModal.dart';
import 'package:corso_finacas/ListCardsTRansicoes.dart';
import 'package:corso_finacas/components/grafico.dart';
import 'package:corso_finacas/components/subMenus.dart';
import 'package:corso_finacas/models/tranzacao.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finanças',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Inter",
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
  // Lista de transações
  final List<Tranzacao> _transacoes = [];

  @override
  void initState() {
    super.initState();
    fetchGastos();
  }

  // Função para abrir o modal de adicionar gasto
  void _openModalForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return AdicionarGastosForm(_adicionarTransacao);
      },
    );
  }

  Future<void> fetchGastos() async {
    try {
      var response =
          await Dio().get("https://api.juniorbelem.com/list/gastos/todos");

      var data = response.data;

      if (data != null && data is Map && data['resultadoVerificacao'] != null) {
        setState(() {
          _transacoes.clear();

          // Itera sobre os dados e adiciona as transações
          for (var item in data['resultadoVerificacao']) {
            _transacoes.add(
              Tranzacao(
                id: _transacoes.length + 1,
                titulo: item['name'] ?? 'Nome não disponível',
                valor: (item['valor'] != null && item['valor'] is num)
                    ? (item['valor'] as num).toDouble()
                    : 0.0,
                data: DateTime.parse(item['data']).toLocal(),
                avatarImage: item['avatarImage'] ??
                    'https://http2.mlstatic.com/storage/activities-middle-end/activities-assets/rowfeed/svg/ic_payments_default_v2.svg',
              ),
            );
          }
        });
      } else {
        print("Estrutura de dados inesperada: $data");
      }
    } catch (error) {
      print("Erro ao buscar dados: $error");
    }
  }

  // Função para adicionar uma transação manualmente
  void _adicionarTransacao(String titulo, double valor) {
    final novaTransacao = Tranzacao(
        id: DateTime.now().microsecondsSinceEpoch,
        titulo: titulo,
        valor: valor,
        data: DateTime.now(),
        avatarImage:
            'https://http2.mlstatic.com/storage/activities-middle-end/activities-assets/rowfeed/svg/ic_payments_default_v2.svg');

    setState(() {
      _transacoes.add(novaTransacao);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GraficoCard(
              transacoes: _transacoes,
            ),
            Submenus(
              openModal: _openModalForm, // Passando a função de abrir modal para o filho
            ),
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
                        "Atividades",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.normal),
                      ),
                      Row(
                        children: [
                          Text(
                            "Esse mês",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.normal),
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Listcardstransicoes(transacoes: _transacoes),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
