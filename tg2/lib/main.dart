import 'package:flutter/material.dart';
import 'package:tg2/data/data.dart';
import 'package:tg2/widgets/mostrar_admin_control.dart';
import 'package:tg2/widgets/mostrar_antidoping.dart';
import 'package:tg2/widgets/mostrar_classificacao.dart';
import 'package:tg2/widgets/mostrar_clubes.dart';
import 'package:tg2/widgets/mostrar_competicoes.dart';
import 'package:tg2/widgets/mostrar_contratos_expirar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //O método "build" é chamado pelo framework para renderizar a interface
    return Scaffold(
      //Scaffold", é uma tela padrão com uma barra de navegação e outros elementos comuns, como barra lateral, corpo e rodapé
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(25, 25, 112, 40),
          title: Image.asset('assets/images/logo.png',
              fit: BoxFit.contain, height: 50, color: Colors.white),
          centerTitle: true),
      body: Container(
        color: const Color.fromRGBO(248, 248, 248, 1),
        alignment: Alignment.center,
        //O "body" é preenchido com o resultado do método "mostrarClubes", que exibe os clubes
        child: MostrarClubes(clubes, jogadores),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 32.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(25, 25, 112, 40),
                ),
                child: null,
              ),
            ),
            // lista que exibe um ícone, um título e uma ação ao ser tocado
            ListTile(
              leading: const Icon(Icons.emoji_events_outlined),
              title: const Text('Classificação da Liga'),
              onTap: () {
                final mostrarClassificacaoPagina = Classificacao();
                final route = MaterialPageRoute(
                  builder: (context) => mostrarClassificacaoPagina,
                );
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: const Icon(Icons.content_paste_off_outlined),
              title: const Text('Contrato a expirar (6 meses)'),
              onTap: () {
                final mostrarContratoPagina =
                    MostrarContrato(jogadores, clubes);
                final route = MaterialPageRoute(
                  builder: (context) => mostrarContratoPagina,
                );
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: const Icon(Icons.content_paste_off_outlined),
              title: const Text('Jogadores inscritos em competições'),
              onTap: () {
                final mostrarCompeticoesPagina =
                    MostrarCompeticoes(competicoes, clubes, jogadores);
                final route = MaterialPageRoute(
                  builder: (context) => mostrarCompeticoesPagina,
                );
                Navigator.push(context, route);
              },
            ),
            ListTile(
                leading: const Icon(Icons.vaccines_outlined),
                title: const Text('Controlo antidoping'),
                onTap: () {
                  final mostrarAntiDopingPagina = MostrarAntiDoping(jogadores);
                  final route = MaterialPageRoute(
                    builder: (context) => mostrarAntiDopingPagina,
                  );
                  Navigator.push(context, route);
                }),
            ListTile(
              leading: const Icon(Icons.android_outlined),
              title: const Text('Pagina de Admin'),
              onTap: () {
                final mostrarAdminPagina = MostrarAdmin(competicoes);
                final route = MaterialPageRoute(
                  builder: (context) => mostrarAdminPagina,
                );
                Navigator.push(context, route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
