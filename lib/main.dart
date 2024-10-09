import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:preojeto/view/cadastro_view.dart';
import 'package:preojeto/view/detalhes_view.dart';
import 'package:preojeto/view/esqueci_senha_view.dart';
import 'package:preojeto/view/login_view.dart';
import 'package:preojeto/view/menu_view.dart';
import 'package:preojeto/view/categoria_view.dart';
import 'package:preojeto/view/pedidos_view.dart';
import 'package:preojeto/services/pedido_service.dart';
import 'package:preojeto/view/perfil_view.dart'; // Importar o serviço de pedidos

void main() {
  setup(); // Registrar o serviço de pedidos antes de executar o app
  print('PedidoService registrado: ${getIt<PedidoService>()}'); // Teste de registro
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
        'categoria': (context) => const CategoriaView(),
        'esqueci_senha': (context) => EsqueciSenhaView(),
        'pedidos': (context) => PedidosView(), // Navegar para a tela de pedidos
        'perfil': (context) => PerfilView(),
      },
    );
  }
}
