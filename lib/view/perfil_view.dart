import 'package:flutter/material.dart';

class PerfilView extends StatelessWidget {
  const PerfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Receber os argumentos da navegação
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    // Verifica se args é nulo ou vazio
    if (args == null || args.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Perfil'),
          backgroundColor: Color(0xFFFFD600),
        ),
        body: Center(child: Text('Erro: Sem informações do usuário')),
      );
    }

    // Caso os argumentos sejam válidos, exibe as informações do usuário
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Color(0xFFFFD600),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informações do Usuário',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Nome: ${args['nome']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('E-mail: ${args['email']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            // Se necessário, você pode adicionar telefone ou outros dados aqui
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica de logout
                Navigator.pushReplacementNamed(context, 'login'); // Navega para a tela de login
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFD600), // Cor de fundo do botão
              ),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}