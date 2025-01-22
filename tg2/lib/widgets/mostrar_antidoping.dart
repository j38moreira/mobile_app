import 'package:flutter/material.dart';
import 'package:tg2/models/jogador.dart';

class MostrarAntiDoping extends StatefulWidget {
  final List<Jogador> jogadores;
  MostrarAntiDoping(this.jogadores);

  @override
  _MostrarAntiDopingState createState() => _MostrarAntiDopingState();
}

class _MostrarAntiDopingState extends State<MostrarAntiDoping> {
  List<Jogador> _testeDias =
      []; //Uma lista para armazenar os jogadores que não foram submetidos a um teste anti-doping há mais de x dias.
  int _dias =
      0; // Variável para armazenar o número de dias que o jogador não foi submetido ao teste.

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: const Color.fromRGBO(25, 25, 112, 40),
                title: Image.asset('assets/images/logo.png',
                    fit: BoxFit.contain, height: 50, color: Colors.white),
                centerTitle: true),
            body: Column(children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      const Text(
                          "Lista de jogadores que não foram sujeitos a teste antidoping"),
                      const Text("há mais de x dias"),
                      Center(
                        child: Card(
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: SizedBox(
                              width: 100,
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration:
                                      const InputDecoration(labelText: 'dias'),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      _dias = int.parse(value);
                                    });
                                  },
                                ),
                              ),
                            )),
                      ),
                    ])),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _testeDias = widget.jogadores
                        .where((jogador) => jogador.antidoping.isBefore(
                            DateTime.now().subtract(Duration(days: _dias))))
                        .toList();
                    //Atualiza a lista de jogadores que não foram submetidos a um teste anti-doping há mais de x dias.
                  });
                },
                child: const Text('Mostrar jogadores'),
              ),
              Expanded(
                  //Widget que ocupa todo o espaço disponível na direção principal.
                  child: ListView.builder(
                      // Widget que exibe uma lista de widgets que são gerados
                      itemCount: _testeDias.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_testeDias[index].nome),
                          subtitle: Text(
                              'Último teste há ${DateTime.now().difference(_testeDias[index].antidoping).inDays} dias'),
                        );
                      }))
            ])));
  }
}
