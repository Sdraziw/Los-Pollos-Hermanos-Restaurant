import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:preojeto/view/cadastro_view.dart';
import 'package:preojeto/view/detalhes_view.dart';
import 'package:preojeto/view/login_view.dart';
import 'package:preojeto/view/menu_view.dart';

void main() {
  runApp(
    DevicePreview(builder: (context) => const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginView(),
        'cadastro': (context) => const CadastroView(),
        'menu': (context) => const MenuView(),
        'detalhes': (context) => const DetalhesView(),
      },
    );
  }
}
