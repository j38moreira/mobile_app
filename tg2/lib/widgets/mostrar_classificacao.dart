import 'package:flutter/material.dart';
import 'package:tg2/data/data.dart';
import 'package:tg2/models/jornada.dart';

class Classificacao extends StatefulWidget {
  @override
  _ClassificacaoState createState() => _ClassificacaoState();
}

class _ClassificacaoState extends State<Classificacao> {
  int _jornadaSelecionada = 1;

  @override
  Widget build(BuildContext context) {
    //Filtra a lista das jornadas para obter apenas as jornadas com id igual ao selecionado no dropmenu e ordena a lista por pontos na ordem decrescente
    final pontosOrdenados = jornadas.where((jornada) => jornada.idJornada == _jornadaSelecionada).toList();
    pontosOrdenados.sort((a, b) => b.pontos.compareTo(a.pontos));

    String getClubeNome(int idClube) {
      String nome = '';
      for (var clube in clubes) {
        if (clube.idClube == idClube) {
          nome = clube.nomeClube;
        }
      }
      return nome;
    }


    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(25, 25, 112, 40),
          title: Image.asset('assets/images/logo.png',
              fit: BoxFit.contain, height: 50, color: Colors.white),
          centerTitle: true),
      body: Column(
        children:[
          //Dropdown menu para a seleção da jornada
          DropdownButton<int>(
            items: const [
              DropdownMenuItem<int>(
                value: 1,
                child: Text('Jornada 1'),
              ),
              DropdownMenuItem<int>(
                value: 2,
                child: Text('Jornada 2'),
              ),
              DropdownMenuItem<int>(
                value: 3,
                child: Text('Jornada 3'),
              ),
            ],
            //Ao selecionar uma jornada, atualiza a variavel _jornadaSelecionada
            onChanged: (value) {
              setState(() {
                _jornadaSelecionada = value!;
              });
            },
            value: _jornadaSelecionada,
          ),
          //Linha de cabeçalho da tabela de classificação
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 30,
                height: 30,
                child: const Text('#'),
              ),
              const SizedBox(width: 20),
              Container(alignment: Alignment.center, child: const Text('Equipa')),
              const Spacer(),
              const SizedBox(
                width: 28,
                child: Text(''),
              ),
              const SizedBox(
                width: 5,
              ),
              const SizedBox(
                width: 28,
                child: Text(''),
              ),
              const SizedBox(
                width: 5,
              ),
              const SizedBox(
                width: 28,
                child: Text('V'),
              ),
              const SizedBox(
                width: 5,
              ),
              const SizedBox(
                width: 28,
                child: Text('E'),
              ),
              const SizedBox(
                width: 5,
              ),
              const SizedBox(
                width: 28,
                child: Text('D'),
              ),
              const SizedBox(
                width: 5,
              ),
              const SizedBox(
                width: 28,
                child: Text('Pts'),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
          //Apresenta a tabela de classificação para a jornada selecionada, ordenada por pontos em ordem decrescente
          Expanded(
            child: ListView.builder(
              itemCount: pontosOrdenados.length,
              itemBuilder: (context, index){
                  Jornada jornada = pontosOrdenados[index];
                    //Verifica se o id da jornada selecionada é igual ao id da jornada 
                  if (jornada.idJornada == _jornadaSelecionada) {
                      return Container(
                      width: double.infinity,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.5),
                        color: Colors.grey[300],
                      ),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 30,
                            height: 30,
                            //If para a representacao (1. verde, 17 e 18 vermelho e o resto das equipas a cinza)
                            color: index < 1
                                          ? Colors.lightGreen[900]
                                          : index > 15
                                                  ? Colors.red
                                                  : Colors.grey[700],
                            child: Text(
                              (index + 1).toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                                    getClubeNome(jornada.idClube),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          const Spacer(),
                          const SizedBox(
                            width: 28,
                            child: Text(''),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const SizedBox(
                            width: 28,
                            child: Text(''),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 28,
                            child: Text(
                                    jornada.vitorias.toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 28,
                            child: Text(
                                    jornada.empates.toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 28,
                            child: Text(
                                    jornada.derrotas.toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 28,
                            child: Text(
                                    jornada.pontos.toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    );
                  }else{
                    return Container();
                  }
                }  
              )
          )  
        ],
      ),
    );      
  }
}




