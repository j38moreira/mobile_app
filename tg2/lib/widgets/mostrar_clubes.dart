import 'package:flutter/material.dart';
import 'package:tg2/models/clube.dart';
import 'package:tg2/models/jogador.dart';
import 'mostrar_plantel.dart';

class MostrarClubes extends StatelessWidget {
  final List<Clube> clubes;
  final List<Jogador> jogadores;
  MostrarClubes(this.clubes, this.jogadores);

  @override
  Widget build(BuildContext context) {
    List<Widget> imagens = [];

    for (int i = 0; i < clubes.length; i++) {
      // Loop que percorre a lista de clubes.
      imagens.add(Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          //muda a distância á esquerda e direita de cada imagem
          child: Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  // Ação do botão quando pressionado: vai para uma página que mostra o plantel do clube
                  // passa o id do clube como argumento
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          MostrarPlantel(clubes[i].idClube, jogadores),
                    ), //Navega para a página mostrarPlantel, passando o id do clube e a lista de jogadores como argumentos
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
              ))));
    }
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //muda a distância de cada linha
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagens.sublist(0, 3),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          //subconjuntos diferentes da lista "imagens". Cada uma adiciona uma Row widget com o subconjunto da lista "imagens" e o alinhamento principal definido como sendo o centro
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagens.sublist(3, 6),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagens.sublist(6, 9),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagens.sublist(9, 12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagens.sublist(12, 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagens.sublist(15, 18),
          ),
        ),
      ],
    ));
  }
}
