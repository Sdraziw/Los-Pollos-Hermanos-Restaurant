import 'package:flutter/material.dart';
import 'package:preojeto/model/user_model.dart'; // Certifique-se de importar o modelo de usuário

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

    final String email = args['email'] ?? 'E-mail não informado';
    final String senha = args['senha'] ?? 'Senha não informada';

    // Verifica se o usuário existe no vetor
    Usuario? usuario = Usuario.usuarios.firstWhere(
      (user) => user.email == email && user.senha == senha,
      orElse: () => Usuario(nome: 'Usuário Desconhecido', email: email, senha: ''), // Retorna um usuário "desconhecido"
    );

    // Se o usuário for desconhecido, mostra um erro
    if (usuario.nome == 'Usuário Desconhecido') {
      return Scaffold(
        appBar: AppBar(
          title: Text('Perfil'),
          backgroundColor: Color(0xFFFFD600),
        ),
        body: Center(child: Text('Erro: Usuário não encontrado')),
      );
    }

    // Caso o usuário seja encontrado
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
            Text('Nome: ${usuario.nome}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('E-mail: ${usuario.email}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            // Se necessário, você pode adicionar telefone ou outros dados aqui
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica de logout
                Navigator.pushReplacementNamed(context, 'login'); // Navega para a tela de login
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFD600), // Cor de fundo do botão
              ),
            ),
          ],
        ),
      ),
    );
  }
}