import 'package:flutter/material.dart';
import 'package:tg2/models/clube.dart';
import 'package:tg2/models/jogador.dart';

class MostrarContrato extends StatelessWidget {
  final List<Jogador> jogadores;
  final List<Clube> clubes;
  MostrarContrato(this.jogadores, this.clubes);

  @override
  Widget build(BuildContext context) {
    List<Jogador> contratoMeses = [];
    for (int i = 0; i < jogadores.length; i++) {
      Jogador jogador = jogadores[i];
      var currentDate = DateTime.now();
      var contractDate = jogador.contrato;
      var duration = contractDate.difference(currentDate);
      var months = (duration.inDays / 30).round();
      if (months <= 6) {
        contratoMeses.add(jogador);
      }
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(25, 25, 112, 40),
          title: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
            height: 50,
            color: Colors.white,
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: contratoMeses.length,
            itemBuilder: (context, index) {
              Jogador jogador = contratoMeses[index];
              var mClube = clubes.firstWhere((club) => club.idClube == jogador.idClube).nomeClube;
              var difDias = jogador.contrato.difference(DateTime.now()).inDays;
              var mensagem = difDias < 0 
                            ? "Contrato já expirou há ${difDias.abs().toString()} dias" 
                            : "$difDias dias para o contrato acabar";
              return Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(jogador.nome),
                      subtitle: Text("${jogador.posicao}, $mClube\n$mensagem"),
                    )
                  ],
                ),
              );
            }
        ),
    );
  }
}
