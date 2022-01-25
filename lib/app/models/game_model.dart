class GameModel {
  String nome;
  String descricao;
  String tipo;
  String imagem;
  String link;

  GameModel({
    required this.nome,
    this.descricao = 'lorem lorem lorem lorem lorem',
    this.imagem = '',
    this.tipo = 'Jogo',
    this.link =
        'https://www.youtube.com/watch?v=T8r3cWM4JII&ab_channel=oskar1101pl',
  });

  static GameModel fromJson(Map data) {
    return GameModel(
      nome: data['nome'] ?? '',
      descricao: data['descricao'] ?? '',
      tipo: data['tipo'] ?? '',
      imagem: data['imagem'] ?? '',
      link: data['link'] ??
          'https://www.youtube.com/watch?v=T8r3cWM4JII&ab_channel=oskar1101pl',
    );
  }
}
