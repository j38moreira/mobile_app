import 'package:flutter/material.dart';
import 'package:tg2/models/clube.dart';
import 'package:tg2/models/competicao.dart';
import 'package:tg2/models/jogador.dart';
import 'package:tg2/widgets/mostrar_inscritos.dart';

class MostrarCompeticoes extends StatelessWidget {
  final List<Competicao> competicoes;
  final List<Jogador> jogadores;
  final List<Clube> clubes;
  MostrarCompeticoes(this.competicoes, this.clubes, this.jogadores);

  @override
  Widget build(BuildContext context) {
    List<Widget> imagens = [];
    for (int i = 0; i < competicoes.length; i++) {
      //vai percorrer as competições existentes
      int clubesNumber =
          4; //clubes a mostrar vai ser iniciado por 4 se as outras contições não forem concretizadas
      //se clicar na primeira competição que neste caso está na posição 0 é apresentada uma certa condição
      if (i == 0) {
        //"i" é igual a 0, o valor de "clubesNumber" é atualizado para ser o comprimento da lista "clubes"
        clubesNumber = clubes.length;
      } else if (i == 2) {
        clubesNumber = 2;
      }
      imagens.add(Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    //é uma função que exibe a lista de inscritos. É chamada com os argumentos "clubes.sublist(0, clubesNumber)" e "jogadores"
                    builder: (context) => MostrarInscritos(
                        clubes.sublist(0, clubesNumber), jogadores),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    Image.asset(competicoes[i].imagemCompeticao,
                        fit: BoxFit.contain, height: 50, width: 50),
                  ],
                ),
              ),
            ),
          )));
    }

    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(25, 25, 112, 40),
            title: Image.asset('assets/images/logo.png',
                fit: BoxFit.contain, height: 50, color: Colors.white),
            centerTitle: true),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //muda a distância de cada linha
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imagens,
              ),
            ),
          ],
        ));
  }
}
