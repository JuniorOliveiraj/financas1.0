import 'package:corso_finacas/models/tranzacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GraficoCard extends StatelessWidget {
  final List<Tranzacao> transacoes;

  const GraficoCard({super.key, required this.transacoes});

  @override
  Widget build(BuildContext context) {
    // Calcula a soma dos valores das transações
    final totalValor =
        transacoes.fold<double>(0, (soma, transacao) => soma + transacao.valor);
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
                      "R\$ -${totalValor.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Column(
                //padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
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
