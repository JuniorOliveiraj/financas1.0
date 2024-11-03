import 'package:corso_finacas/components/CardsTransacao.dart';
import 'package:corso_finacas/models/tranzacao.dart';
import 'package:flutter/material.dart';

class Listcardstransicoes extends StatelessWidget {
  const Listcardstransicoes({super.key, required this.transacoes});

  final List<Tranzacao> transacoes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600, // Defina a altura ou use uma que se ajuste à tela
      child: transacoes.isEmpty
          ? const Center(
              child: Text(
                'Nenhuma transação adicionada!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: transacoes.length,
              itemBuilder: (ctx, index) {
                final transacao = transacoes[index];
                return Cardstransacao(
                  data: transacao.data,
                  titulo: transacao.titulo,
                  valor: transacao.valor,
                );
              },
            ),
    );
  }
}
