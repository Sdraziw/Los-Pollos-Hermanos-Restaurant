/* Adicional esqueci minha senha
Não solicitado, porém adaptado ao projeto
*/

import 'package:flutter/material.dart';

class EsqueciSenhaView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redefinir Senha'),
        backgroundColor: Color(0xFFFFD600), // Cor da AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Digite seu e-mail para receber as instruções de redefinição de senha:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text;

                // Aqui você pode implementar a lógica para enviar um e-mail de redefinição de senha.
                // Simulando uma mensagem de sucesso.
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Instruções enviadas para $email!'),
                  ),
                );

                // Voltar para a tela de login
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFD600), // Cor do botão
              ),
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
