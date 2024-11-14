// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/text_field.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool _obscureText2 = true;

  final txtNome = TextEditingController();
  final txtEmail = TextEditingController();
  final txtConfirmaEmail = TextEditingController();
  final txtSenha = TextEditingController();
  final txtConfirmaSenha = TextEditingController();

  // Função para salvar o estado de "Lembre-se de mim" e credenciais
  void _saveRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberMe', true);
    prefs.setString('email', txtEmail.text);
    prefs.setString('senha', txtSenha.text);
  }

  // Função de Cadastro com Firebase Auth
  Future<void> _register() async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: txtEmail.text,
          password: txtSenha.text,
        );

        // Salvar nome do usuário no Firestore
        await FirebaseFirestore.instance.collection('usuarios').doc(userCredential.user!.uid).set({
          'nome': txtNome.text,
          'email': txtEmail.text,
        });

        _saveRememberMe();
        Navigator.pushNamed(context, 'menu');
        _showMessage('Conta criada com sucesso', Colors.greenAccent);
      } catch (e) {
        _showMessage('Erro ao criar conta: $e', Colors.redAccent);
      }
    }
  }

  // Exibir mensagem com SnackBar
  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: color,successfully
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                'Criar Conta',
                style: TextStyle(fontSize: 60),
              ),
              SizedBox(height: 60),
              campoTexto('Nome', txtNome, Icons.person),
              TextFormField(
                controller: txtEmail,
                decoration: InputDecoration(labelText: 'E-mail', prefixIcon: Icon(Icons.email)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu e-mail';
                  } else if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                    return 'Formato de e-mail inválido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: txtConfirmaEmail,
                decoration: InputDecoration(labelText: 'Confirme seu E-mail', prefixIcon: Icon(Icons.email)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, confirme seu e-mail';
                  } else if (value != txtEmail.text) {
                    return 'Os e-mails não coincidem';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: txtSenha,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  } else if (value.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: txtConfirmaSenha,
                obscureText: _obscureText2,
                decoration: InputDecoration(
                  labelText: 'Confirme sua Senha',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText2 ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText2 = !_obscureText2;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, confirme sua senha';
                  } else if (value != txtSenha.text) {
                    return 'As senhas não coincidem';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}