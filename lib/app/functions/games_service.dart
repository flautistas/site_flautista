import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:site_flautistas/app/models/game_model.dart';

class GamesService {
  late List<GameModel> _games;

  GamesService() {
    _games = [
      GameModel(
        nome: 'GTA 5',
        descricao: 'Jogo brabo',
        tipo: 'Mundo aberto',
        imagem: 'https://upload.wikimedia.org/wikipedia/pt/8/80/Grand_Theft_Auto_V_capa.png',
      ),
      GameModel(
        nome: 'NFS',
        tipo: 'Corrida',
        imagem: 'https://upload.wikimedia.org/wikipedia/pt/a/ad/Nfsmw_capa_pt.jpg',
      ),
      GameModel(
        nome: 'MINECRAFT',
        tipo: 'RPG',
        imagem: 'https://upload.wikimedia.org/wikipedia/pt/thumb/9/9c/Minecraft_capa.png/260px-Minecraft_capa.png',
      ),
    ];
  }

  /// Esse método retorna uma lista estatica
  List<GameModel> getGames() {
    return _games;
  }

  void addGame(GameModel game) {
    _games.add(game);
  }

  Future<List<GameModel>> getGamesOnline() async {
    CollectionReference gamesReference = FirebaseFirestore.instance.collection('games');
    final games = await gamesReference.get();

    final documents = games.docs;

    final listGames = <GameModel>[];

    for (var document in documents) {
      if (document.exists) {
        listGames.add(GameModel.fromJson(document.data()! as Map<String, dynamic>));
      }
    }
    return listGames;
  }
}
