import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:site_flautistas/app/functions/games_service.dart';
import 'package:site_flautistas/app/models/game_model.dart';
import 'package:site_flautistas/app/pages/area_teste/test_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioPlayer audioPlayer = AudioPlayer();

  Future<void> playBackground() async {
    await audioPlayer.play('assets/music/darkorbit.mp3');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.0,
                  0.19,
                  0.85,
                  1,
                ],
                colors: [
                  Colors.black,
                  Colors.purple,
                  Colors.yellow,
                  Colors.orange,
                ],
              ),
            ),
          ),
          _buildBody(),
        ],
      ),
    );
  }

  Container _buildBody() {
    GamesService gameService = GamesService();

    final games = gameService.getGamesOnline();

    var sizeText = const TextStyle(fontSize: 50);

    return Container(
      constraints: const BoxConstraints.expand(),
      child: Center(
        child: SingleChildScrollView(
          child: FutureBuilder<List<GameModel>>(
            future: games,
            builder: (BuildContext context, AsyncSnapshot<List<GameModel>> snapshot) {
              if (snapshot.hasError) {
                return const Text("Ocorreu um erro nessa merda");
              }

              if (snapshot.hasData && snapshot.data!.isEmpty) {
                return const Text("Sem jogos para exibir");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                final gamesFirebase = snapshot.data!;
                return GridView.count(
                  primary: false,
                  shrinkWrap: true,
                  crossAxisCount: MediaQuery.of(context).size.width < 400 ? 1 : 2,
                  children: [
                    for (var game in gamesFirebase) _buildCard(game),
                  ],
                );
              }

              return const Text("Carregando jogos de nerdolas");
            },
          ),
        ),
      ),
    );
  }

  Card _buildCard(GameModel gameModel) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 3,
              child: Image.network(
                gameModel.imagem,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                gameModel.nome,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('BAIXAR'),
              onPressed: () async {
                if (!await launch(
                  gameModel.link,
                )) {
                  throw 'Não foi possível abrir ${gameModel.link}';
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
