import 'package:audioplayers/audioplayers.dart';

AudioPlayer audioPlayer = AudioPlayer();

Future<void> playBackground() async {
  await audioPlayer.play('assets/music/darkorbit.mp3');
}
