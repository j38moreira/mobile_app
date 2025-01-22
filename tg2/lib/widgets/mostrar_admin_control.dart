import 'package:flutter/material.dart';
import 'package:tg2/models/competicao.dart';

class MostrarAdmin extends StatefulWidget {
  final List<Competicao> competicoes;
  MostrarAdmin(this.competicoes);

  // Sobrescreve o método createState da classe StatefulWidget
  @override
  MostrarEstadoCompeticoes createState() => MostrarEstadoCompeticoes();
} //O método createState retorna uma instância de MostrarEstadoCompeticoes, que será a classe responsável por manter o estado

//apagar competições

class MostrarEstadoCompeticoes extends State<MostrarAdmin> {
  //Define a classe MostrarEstadoCompeticoes como o estado da classe mostrarAdmin
  void _apagarCompeticao(int index) {
    //Define o método _apagarCompeticao
    setState(() {
      //Usa a função setState para atualizar o estado da tela
      widget.competicoes.removeAt(index);
      //Remove a competição na posição especificada pelo índice
    });
  }

  //Modificar competições
  void _editarCompeticao(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Editar competição"),
          content: TextField(
            decoration: const InputDecoration(
                labelText:
                    'Edite o nome da competição:'), //Adiciona um campo de texto ao conteúdo do diálogo, que inclui o texto "Edite o nome da competição:".
            onChanged: (value) {
              setState(() {
                widget.competicoes[index].nomeCompeticao = value;
              }); //Chama setState para atualizar o estado do widget com o novo valor do nome da competição na posição especificada pelo índice.
            },
          ),
          actions: <Widget>[
            //botao de confirmar
            ElevatedButton(
              child: const Text("Confirmar"),
              onPressed: () {
                Navigator.of(context).pop();
                // Fecha o diálogo chamando pop no navegador do contexto atual.
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(25, 25, 112, 40),
            title: Image.asset('assets/images/logo.png',
                fit: BoxFit.contain, height: 50, color: Colors.white),
            centerTitle: true),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(widget.competicoes.length, (index) {
            return Container(
              margin: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(widget.competicoes[index].imagemCompeticao,
                      fit: BoxFit.contain, height: 80, width: 80),
                  Text(widget.competicoes[index].nomeCompeticao),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () => _editarCompeticao(index),
                        child: const Text("Editar"),
                      ),
                      ElevatedButton(
                        onPressed: () => _apagarCompeticao(index),
                        child: const Text('Apagar'),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
        ));
  }
}
