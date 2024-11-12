import 'package:corso_finacas/models/tranzacao.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GraficoCard extends StatefulWidget {
  final List<Tranzacao> transacoes;

  const GraficoCard({super.key, required this.transacoes});

  @override
  _GraficoCardState createState() => _GraficoCardState();
}

class _GraficoCardState extends State<GraficoCard> {
  double? totalGastos;

  @override
  void initState() {
    super.initState();
    _fetchGastos();
  }

  // Função para fazer a requisição HTTP
  Future<void> _fetchGastos() async {
    try {
      var response = await Dio().get("https://api.juniorbelem.com/charts/gastos");

      // Acessa o campo "Total" dentro da lista "values"
      var data = response.data;
      if (data != null && data is Map && data['values'] != null) {
        var total = data['values'][0]['Total'];

        // Atualiza o estado com o total formatado
        setState(() {
          totalGastos = total.toDouble();
        });
      } else {
        print("Estrutura de dados inesperada: $data");
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calcula a soma dos valores das transações
    //final totalValor = widget.transacoes.fold<double>(0, (soma, transacao) => soma + transacao.valor);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        height: 200,
        child: Card(
          color: const Color.fromARGB(255, 0, 0, 0),
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 23, 0, 0),
                    child: SvgPicture.asset(
                      'assets/images/cib_visa.svg',
                      width: 60, // Ajuste a largura conforme necessário
                      semanticsLabel: 'Grafico',
                    ),
                  ),
                  const Spacer(), // Adiciona um espaço flexível entre os textos
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                    child: Text(
                      "Junior de Oliveira",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                    child: Text(
                      "R\$ ${totalGastos != null ? totalGastos!.toStringAsFixed(2) : 'Carregando...'}",
                      style: const TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: SvgPicture.asset(
                      'assets/images/svgs/StyleCard.svg',
                      width: 150, // Ajuste a largura conforme necessário
                      semanticsLabel: 'Grafico',
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
