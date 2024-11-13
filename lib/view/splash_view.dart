import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late VideoPlayerController _videoController;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    // Inicia a configuração de vídeo
    _iniciarVideo();

    // Inicia a configuração do áudio
    _iniciarAudio();

    // Navega para a próxima tela após a reprodução do vídeo
    _videoController.addListener(() {
      if (_videoController.value.position == _videoController.value.duration) {
        Navigator.pushReplacementNamed(context, 'login');
      }
    });
  }

  // Função para iniciar o vídeo
  void _iniciarVideo() {
    _videoController = VideoPlayerController.asset('lib/videos/coke.mp4')
      ..initialize().then((_) {
        setState(() {});
        _videoController.play();
      });
  }

  // Função para iniciar o áudio
  void _iniciarAudio() {
    _audioPlayer = AudioPlayer();
    _audioPlayer.play(AssetSource('lib/audios/breaking_bad.mp3')); // Corrigido para usar AssetSource
  }

  @override
  void dispose() {
    _videoController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _videoController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _videoController.value.aspectRatio,
                  child: VideoPlayer(_videoController),
                )
              : Center(child: CircularProgressIndicator()),
          Center(
            child: Text(
              'Los Pollos Hermanos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}