import 'package:flutter/material.dart';
import 'package:tg2/models/jogador.dart';

class MostrarPlantel extends StatelessWidget {
  final int idClube;
  List<Jogador> jogadores;
  MostrarPlantel(this.idClube, this.jogadores);

  @override
  Widget build(BuildContext context) {
    // Filter the jogadores list to only include players belonging to the club
    List<Jogador> jogadoresClube = jogadores
        .where((jogador) => jogador.idClube == idClube)
        .toList(); //filtra apenas aqueles cujo idClube seja igual ao idClube especificado como argumento, o resultado final é convertido para uma lista usando o método "toList".

    // Create a list of widgets to display the player information
    List<Widget> jogadoresWidgets = [];
    for (int i = 0; i < jogadoresClube.length; i++) {
      //Para cada jogador na lista jogadoresClube, um widget Card é adicionado à lista jogadoresWidgets
      jogadoresWidgets.add(
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Center(child: Text(jogadoresClube[i].nome)),
                subtitle: Text('Peso: ${jogadoresClube[i].peso} kg\n'
                    'Altura: ${jogadoresClube[i].altura} cm\n'
                    'Escolaridade: ${jogadoresClube[i].escolaridade}\n'
                    'Posição: ${jogadoresClube[i].posicao}\n'
                    'Data de contratação: ${jogadoresClube[i].dataContratacao.toString().substring(0, 10)}\n'
                    'Contrato até: ${jogadoresClube[i].contrato.toString().substring(0, 10)}\n'
                    'ID do passaporte: ${jogadoresClube[i].idPassaporte}\n'
                    'Data do último teste antidoping: ${jogadoresClube[i].antidoping.toString().substring(0, 10)}\n'),
              )
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(25, 25, 112, 40),
          title: Image.asset('assets/images/logo.png',
              fit: BoxFit.contain, height: 50, color: Colors.white),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 8.0, // espaço entre as cards
          runSpacing: 4.0, // espaço entre as linhas
          children: jogadoresWidgets,
        ),
      ),
    );
  }
}
