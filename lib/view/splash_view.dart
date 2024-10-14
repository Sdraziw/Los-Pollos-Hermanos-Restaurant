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

    // Navega para a próxima tela após 5 segundos
    Future.delayed(const Duration(seconds: 5), () {
      if (_videoController.value.isInitialized) {
        Navigator.pushNamed(context, 'login');
      }
    });
  }

  /// Método para inicializar e configurar o vídeo
  Future<void> _iniciarVideo() async {
    _videoController = VideoPlayerController.asset('lib/videos/coke.mp4')
      ..initialize().then((_) {
        setState(() {}); // Atualiza o estado para reconstruir a tela
        _videoController.play();
        _videoController.setLooping(true); // Repetir vídeo em loop
      }).catchError((error) {
        debugPrint('Erro ao carregar vídeo: $error');
      });
  }

  /// Método para inicializar e configurar o áudio
  Future<void> _iniciarAudio() async {
    _audioPlayer = AudioPlayer();
    try {
      // Carrega o áudio do asset
      await _audioPlayer.setSource(AssetSource('lib/audios/breaking_bad.mp3'));

      // Define o modo de liberação para repetir o áudio em loop
      await _audioPlayer.setReleaseMode(ReleaseMode.loop);

      // Inicia a reprodução
      await _audioPlayer.resume();
    } catch (error) {
      debugPrint('Erro ao carregar áudio: $error');
    }
  }

  @override
  void dispose() {
    _videoController.dispose(); // Libera o controlador de vídeo
    _audioPlayer.dispose(); // Libera o controlador de áudio
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _videoController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              )
            : const CircularProgressIndicator(), // Carregador enquanto o vídeo não está pronto
      ),
    );
  }
}