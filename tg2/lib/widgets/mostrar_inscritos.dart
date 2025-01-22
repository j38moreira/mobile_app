import 'package:flutter/material.dart';
import 'package:tg2/models/clube.dart';
import '../models/jogador.dart';
import 'mostrar_plantel.dart';

class MostrarInscritos extends StatelessWidget {
  final List<Clube> clubes;
  final List<Jogador> jogadores;
  MostrarInscritos(this.clubes, this.jogadores);
  @override
  Widget build(BuildContext context) {
    List<Widget> imagens = [];
    for (int i = 0; i < clubes.length; i++) {
      imagens.add(Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MostrarPlantel(clubes[i].idClube, jogadores),
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: [
                  Image.asset(clubes[i].imagemClube,
                      fit: BoxFit.contain, height: 50, width: 50),
                ],
              ),
            ),
          ),
        ),
      ));
    }
    //inicializada com o resultado da divisão inteira da quantidade de elementos em "imagens" por 3 e arredondado para cima. O resultado é o número de linhas
    int linhas = (imagens.length / 3).ceil();
    //inicializada com a quantidade de elementos em "imagens" dividida pela quantidade de linhas, sem arredondamento
    int itensPorLinha = imagens.length ~/ linhas;

    List<List<Widget>> widgets = List.generate(linhas, (index) {
      return imagens.sublist(
          index * itensPorLinha, (index + 1) * itensPorLinha);
    }); //é uma lista de listas de widgets, gerada a partir do número de linhas. Para cada linha, é retornada uma sublista de "imagens" começando pelo índice "index * itensPorLinha" até "index + 1 * itensPorLinha"
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(25, 25, 112, 40),
        title: Image.asset('assets/images/logo.png',
            fit: BoxFit.contain, height: 50, color: Colors.white),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //Column é definida como o resultado da aplicação do método "map" na lista "widgets", o que retorna uma lista de widgets para serem exibidos na coluna
          children: widgets.map((linha) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: linha,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
