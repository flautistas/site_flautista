import 'package:flutter/material.dart';

class GameAddAPage extends StatefulWidget {
  const GameAddAPage({
    Key? key,
  }) : super(key: key);

  @override
  State<GameAddAPage> createState() => _GameAddAPageState();
}

class _GameAddAPageState extends State<GameAddAPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Jogo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.tag_faces_outlined),
            tooltip: 'Ir para o menu',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(50),
            color: Colors.blue,
            child: const Text('Conteudo'),
          ),
        ],
      ),
    );
  }
}
