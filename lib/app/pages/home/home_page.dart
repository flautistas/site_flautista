import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
        actions: [
          IconButton(
            icon: const Icon(Icons.tag_faces_outlined),
            tooltip: 'Area de teste',
            onPressed: () {},
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
    var sizeText = const TextStyle(fontSize: 50);
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .8,
                alignment: Alignment.center,
                child: Container(
                  height: 200,
                  alignment: Alignment.bottomCenter,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ScaleAnimatedText(
                        'FLAUTISTAS',
                        textStyle: sizeText,
                      ),
                      ScaleAnimatedText(
                        'NEVER',
                        textStyle: sizeText,
                      ),
                      ScaleAnimatedText(
                        'DIE',
                        textStyle: sizeText,
                      ),
                    ],
                  ),
                ),
              ),
              _buildCard(),
            ],
          ),
        ),
      ),
    );
  }

  Card _buildCard() {
    return Card(
      margin: const EdgeInsets.all(50),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text('Login'),
            TextFormField(),
            const SizedBox(height: 20),
            const Text('Senha'),
            TextFormField(
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('ENTRAR'),
              onPressed: () async {
                playBackground();
              },
            ),
          ],
        ),
      ),
    );
  }
}
