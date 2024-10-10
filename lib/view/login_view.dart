/* RF001 Login / Logout
●	A tela de login contém campos de e-mail, senha, logotipo e botões de "Entrar" e "Cadastrar".
●	Validação correta de e-mail (formato) e campos vazios.
●	O botão "Entrar" aciona o login, e "Cadastrar" navega para o cadastro de usuário.
●	O logout redireciona para a tela de login, descartando dados.
*/

import 'package:flutter/material.dart';
import 'package:preojeto/model/user_model.dart'; // Importa a classe Usuario
import 'dart:math'; // Para gerar cores aleatórias

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  Color backgroundColor = const Color(0xFFFFD600);
  final primaryColor = const Color.fromARGB(255, 0, 0, 0);

  final txtValor1 = TextEditingController();
  final txtValor2 = TextEditingController();

  bool _rememberMe = false;
  bool _obscureText = true;
  int clickCount = 0;

  // Função para gerar uma cor aleatória
  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    String desertImage =
        clickCount >= 4 ? "lib/images/deserto1.png" : "lib/images/deserto.png";
    Color containerColor = clickCount >= 4 ? Colors.black : Colors.transparent;
    backgroundColor = clickCount >= 4 ? Colors.black : const Color(0xFFFFD600);

    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            color: backgroundColor,
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 60, 50, 60),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Image(
                      image: AssetImage("lib/images/logo.png"),
                      width: 200,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Login',
                            style: TextStyle(
                              fontSize: 18,
                              color: clickCount >= 4
                                  ? Colors.white
                                  : primaryColor,
                            )),
                      ],
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: txtValor1,
                      style: TextStyle(
                        fontSize: 18,
                        color: clickCount >= 4 ? Colors.white : Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            clickCount >= 4 ? Colors.black54 : Colors.white,
                        labelText: 'Usuário ou e-mail',
                        labelStyle: TextStyle(
                          color: clickCount >= 4
                              ? Colors.white
                              : Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: clickCount >= 4
                                  ? Colors.white
                                  : primaryColor),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira seu e-mail ou usuário';
                        } else if (!RegExp(
                                    r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value) &&
                            !Usuario.usuarios
                                .any((user) => user.nome == value)) {
                          return 'Formato de e-mail ou usuário inválido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: txtValor2,
                      style: TextStyle(
                        fontSize: 18,
                        color: clickCount >= 4 ? Colors.white : Colors.black,
                      ),
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            clickCount >= 4 ? Colors.black54 : Colors.white,
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                          color: clickCount >= 4
                              ? Colors.white
                              : Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: clickCount >= 4
                                  ? Colors.white
                                  : primaryColor),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: clickCount >= 4
                                ? Colors.white
                                : Colors.black,
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
                          return 'Informe sua senha';
                        } else if (value.length < 6) {
                          return 'A senha deve ter pelo menos 6 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          },
                          activeColor: Colors.blue,
                          checkColor: Colors.white,
                        ),
                        Text(
                          'Lembre de mim',
                          style: TextStyle(
                              color: clickCount >= 4
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        const SizedBox(width: 30),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'esqueci_senha');
                          },
                          child: Text(
                            "Esqueci a senha",
                            style: TextStyle(
                              fontSize: 13,
                              color: clickCount >= 4
                                  ? Colors.white
                                  : Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 50),
                        backgroundColor:
                            clickCount >= 4 ? primaryColor : Colors.blue,
                        foregroundColor: clickCount >= 4
                            ? Colors.white
                            : const Color.fromARGB(255, 0, 0, 0),
                        textStyle: const TextStyle(fontSize: 15),
                        side: BorderSide(
                          color: clickCount >= 4 ? Colors.white : Colors.black,
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          String emailOuUsuario = txtValor1.text;
                          String senha = txtValor2.text;

                          if (emailOuUsuario == 'admin@email.com' &&
                              senha == '123456') {
                            Navigator.pushNamed(context, 'menu');
                          } else {
                            Usuario? usuario = Usuario.usuarios.firstWhere(
                              (user) =>
                                  (user.email == emailOuUsuario ||
                                      user.nome == emailOuUsuario) &&
                                  user.senha == senha,
                              orElse: () => Usuario(
                                  nome: '',
                                  email: '',
                                  senha: ''),
                            );

                            if (usuario.nome.isNotEmpty) {
                              Navigator.pushNamed(context, 'menu');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Login ou senha inválidos'),
                                ),
                              );
                            }
                          }
                        }
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 50),
                        backgroundColor: const Color.fromRGBO(122, 124, 125, 1),
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'cadastro');
                      },
                      child: const Text('Cadastrar'),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  clickCount++;
                  if (clickCount == 1) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Clique para mudar a cor e a imagem.')),
                    );
                  } else if (clickCount == 4) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sol não tem sombra.')),
                    );
                  } else if (clickCount >= 5) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Easter Egg ativado!')),
                    );
                  } else if (clickCount >= 10) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Voltamos ao dia!')),
                    );
                    clickCount = 0; // Reseta o contador para 0 após 10 cliques
                  }
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: clickCount >= 4
                    ? 50
                    : 97, // Diminui o tamanho após 4 cliques
                height: clickCount >= 4 ? 50 : 97,
                decoration: BoxDecoration(
                  color: clickCount >= 4
                      ? Colors.white
                      : const Color.fromARGB(255, 243, 135, 33),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    ' ',
                    style: TextStyle(color: Color.fromRGBO(252, 176, 64, 1)),
                  ),
                ),
              ),
            ),
          ),

          // Imagem do deserto na parte inferior
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 150, // Altura fixa
              decoration: BoxDecoration(
                color: containerColor, // Usar a cor do container
                image: DecorationImage(
                  image:
                      AssetImage(desertImage), // Caminho da imagem do deserto
                  fit: BoxFit.cover, // Preenche a largura
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Função para realizar logout (incluída no menu ou onde for apropriado)
void logout(BuildContext context) {
  Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
}
