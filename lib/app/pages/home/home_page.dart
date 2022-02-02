import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:site_flautistas/app/constants/default_colors.dart';
import 'package:site_flautistas/app/functions/games_service.dart';
import 'package:site_flautistas/app/models/game_model.dart';
import 'package:site_flautistas/app/pages/game_add/game_add_page.dart';
import 'package:site_flautistas/app/pages/login_page/login_page.dart';
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
    playBackground();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DefaultColors.blueStranger,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            tooltip: 'Adicionar Jogo',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GameAddAPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            tooltip: 'Login',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginPage(
                          title: 'Flautistas Site',
                        )),
              );
            },
          ),
        ],
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
                  DefaultColors.blueStranger,
                  DefaultColors.blueNocturne,
                  DefaultColors.blueWhite,
                  DefaultColors.blueStranger
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

    return Container(
      constraints: const BoxConstraints.expand(),
      child: Center(
        child: SingleChildScrollView(
          child: FutureBuilder<List<GameModel>>(
            future: games,
            builder: (BuildContext context,
                AsyncSnapshot<List<GameModel>> snapshot) {
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
                  crossAxisCount:
                      MediaQuery.of(context).size.width < 400 ? 1 : 2,
                  children: [
                    for (var game in gamesFirebase) _buildCard(game),
                  ],
                );
              }

              return const Text("CARREGANDO JOGOS DE NERDOLAS",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 30,
                  ));
            },
          ),
        ),
      ),
    );
  }

  Card _buildCard(GameModel gameModel) {
    return Card(
      elevation: 30,
      color: Colors.transparent,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
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
                DefaultColors.blueStranger,
                DefaultColors.blueNocturne,
                DefaultColors.blueWhite,
                DefaultColors.blueStranger
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 3,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Image.network(
                    gameModel.imagem,
                    fit: BoxFit.fitHeight,
                  ),
                  onPressed: () async {
                    if (!await launch(
                      gameModel.link,
                    )) {
                      throw 'Não foi possível abrir ${gameModel.link}';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  gameModel.nome,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Text(
                    gameModel.descricao,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    softWrap: true,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87),
                  )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  gameModel.tipo,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
