/* RF001 Login / Logout
●	A tela de login contém campos de e-mail, senha, logotipo e botões de "Entrar" e "Cadastrar".
●	Validação correta de e-mail (formato) e campos vazios.
●	O botão "Entrar" aciona o login, e "Cadastrar" navega para o cadastro de usuário.
●	O logout redireciona para a tela de login, descartando dados.
*/

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Auth

import 'package:shared_preferences/shared_preferences.dart'; // Preferências locais
import 'dart:math'; // Para gerar cores aleatórias (não utilizado)

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();

  final txtEmail = TextEditingController();
  final txtSenha = TextEditingController();

  bool _rememberMe = false;
  bool _obscureText = true;
  int clickCount = 0;
  Color backgroundColor = const Color(0xFFFFD600);
  final primaryColor = const Color.fromARGB(255, 0, 0, 0);

  @override
  void initState() {
    super.initState();
    _loadRememberMe();
  }

  // Função para carregar o estado de "Lembre-se de mim" e credenciais
  void _loadRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _rememberMe = prefs.getBool('rememberMe') ?? false;
      if (_rememberMe) {
        txtEmail.text = prefs.getString('email') ?? '';
        txtSenha.text = prefs.getString('senha') ?? '';
      }
    });
  }

  // Função para salvar o estado de "Lembre-se de mim" e credenciais
  void _saveRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberMe', _rememberMe);
    if (_rememberMe) {
      prefs.setString('email', txtEmail.text);
      prefs.setString('senha', txtSenha.text);
    } else {
      prefs.remove('email');
      prefs.remove('senha');
    }
  }

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

  // Função de Login com Firebase Auth
  Future<void> _login() async {
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: txtEmail.text,
          password: txtSenha.text,
        );
        _saveRememberMe();
        Navigator.pushNamed(context, 'menu');
        _showMessage('Login realizado com sucesso', Colors.greenAccent);
      } catch (e) {
        _showMessage('Erro no login: $e', Colors.redAccent);
      }
    }
  }

  // Função de Cadastro com Firebase Auth
  Future<void> _register() async {
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: txtEmail.text,
          password: txtSenha.text,
        );
        _saveRememberMe();
        Navigator.pushNamed(context, 'menu');
        _showMessage('Conta criada com sucesso', Colors.greenAccent);
      } catch (e) {
        _showMessage('Erro ao criar conta: $e', Colors.redAccent);
      }
    }
  }

  // Função de Logout
  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
    } catch (e) {
      _showMessage('Erro ao sair: $e', Colors.redAccent);
    }
  }

  // Exibir mensagem com SnackBar
  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Alteração do método build
    clickCount++; // Incrementa o contador de cliques para alterar a imagem

    String desertImage = (clickCount >= 4 && clickCount < 10)
        ? "lib/images/deserto1.png"
        : (clickCount >= 38)
            ? "lib/images/giphy.gif"
            : "lib/images/deserto.png";

    Color containerColor = (clickCount >= 4 && clickCount < 10)
        ? const Color.fromARGB(0, 0, 0, 0)
        : Colors.transparent;

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
                              color:
                                  clickCount >= 4 ? Colors.white : primaryColor,
                            )),
                      ],
                    ),
                    const SizedBox(height: 5),

                    // Campo de E-mail
                    TextFormField(
                      controller: txtEmail,
                      style: TextStyle(
                        fontSize: 18,
                        color: clickCount >= 4 ? Colors.white : Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            clickCount >= 4 ? Colors.black54 : Colors.white,
                        labelText: 'E-mail',
                        labelStyle: TextStyle(
                          color: clickCount >= 4 ? Colors.white : Colors.black,
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
                          return 'Por favor, insira seu e-mail';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'Formato de e-mail inválido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Campo de Senha
                    TextFormField(
                      controller: txtSenha,
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
                          color: clickCount >= 4 ? Colors.white : Colors.black,
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
                            color:
                                clickCount >= 4 ? Colors.white : Colors.black,
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

                    // Checkbox "Lembre de mim"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                            _saveRememberMe();
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
                              color:
                                  clickCount >= 4 ? Colors.white : Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    // Botão de Login
                    ElevatedButton(
                      onPressed: _login,
                       style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 50),
                        backgroundColor: clickCount >= 4
                            ? primaryColor
                            : const Color.fromARGB(255, 0, 0, 0),
                        foregroundColor: clickCount >= 4
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 255, 255, 255),
                        textStyle: const TextStyle(fontSize: 15),
                        side: BorderSide(
                          color: clickCount >= 4
                              ? Colors.white
                              : const Color.fromARGB(255, 0, 0, 0),
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          String emailOuUsuario = txtValor1.text;
                          String senha = txtValor2.text;

                          // Lógica de login
                          if (((emailOuUsuario == 'admin@email.com') ||
                                  (emailOuUsuario == 'teste@teste.com')) &&
                              senha == '123456') {
                            _saveRememberMe(); // Salva o estado do checkbox
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
                              color:
                                  clickCount >= 4 ? Colors.white : Colors.blue,
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
                        backgroundColor: clickCount >= 4
                            ? primaryColor
                            : const Color.fromARGB(255, 0, 0, 0),
                        foregroundColor: clickCount >= 4
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 255, 255, 255),
                        textStyle: const TextStyle(fontSize: 15),
                        side: BorderSide(
                          color: clickCount >= 4
                              ? Colors.white
                              : const Color.fromARGB(255, 0, 0, 0),
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          String emailOuUsuario = txtEmail.text; // Corrigir o nome da variável para txtEmail
                          String senha = txtSenha.text; // Corrigir o nome da variável para txtSenha

                          // Lógica de login
                          if (((emailOuUsuario == 'admin@email.com') ||
                                  (emailOuUsuario == 'teste@teste.com')) &&
                              senha == '123456') {
                            _saveRememberMe(); // Salva as credenciais
                            Navigator.pushNamed(context, 'menu');
                          } else {
                            usuario? usuario = usuario.usuarios.firstWhere( // Corrigir o nome da variável para usuario e adicionar o ponto de interrogação para permitir valores nulos (null safety)
                              (user) =>
                                  (user.email == emailOuUsuario ||
                                      user.nome == emailOuUsuario) &&
                                  user.senha == senha,
                              orElse: () =>
                                  usuario(nome: '', email: '', senha: ''),  // Corrigir o nome da variável para usuario e adicionar o ponto de interrogação para permitir valores nulos (null safety)
                            );

                            if (usuario.nome.isNotEmpty) {
                              // Gerar número do pedido
                              String numeroPedido =
                                  await PedidoService().gerarNumeroPedido(); // Corrigir o nome da classe para PedidoService e adicionar os parênteses para chamar o construtor da classe (null safety)

                              // Passar nome e número do pedido para a tela de pagamento
                              Navigator.pushNamed(
                                context,
                                'menu',
                                arguments: {
                                  'nome': usuario.nome,
                                  'numeroPedido': numeroPedido,
                                },
                              );
                              _saveRememberMe(); // Salva as credenciais
                            } else {
                              LoginController().login(  // Corrigir o nome da classe para LoginController e adicionar os parênteses para chamar o construtor da classe (null safety)
                                context,
                                txtEmail.text,
                                txtSenha.text,
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
            bottom: clickCount >= 4
                ? clickCount + 115
                : clickCount + 80, // Ajuste na posição vertical
            left: MediaQuery.of(context).size.width / 3 - 30 + clickCount * -4,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  clickCount++;
                  if (clickCount == 1) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                        '☼ Sol com sombra?  ${(clickCount)}ª vez que vejo!',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                    );
                  } else if (clickCount == 2) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                        '☀ Sol não tem sombra!  ${(clickCount)}ª vez observando!',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      )),
                    );
                  } else if (clickCount == 3) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                        '☀ Sol se movendo ou estou delirando pela ${(clickCount)}ª vez',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                    );
                  } else if (clickCount == 4) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                        '◌ Lua!? Noite!? 🌙 Delirando ${(clickCount)}ª vez\nAchei que fosse o calor! Mas não era! É FOME!',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      )),
                    );
                  } else if (clickCount == 5) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                        'Devo estar com fome, pela ${(clickCount)}ª vez, estou delirando',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )),
                    );
                  } else if (clickCount == 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Easter Egg ativado!🍀',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );

                    Navigator.pushNamed(context, 'promo');
                  } else if (clickCount == 10) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Olhos de águia! ☽',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  } else if (clickCount == 16) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          '☽ Até gostei deste tema noturno! 🌙',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  } else if (clickCount == 37) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Essa águia está de olho no meu lanche!\nVeja o cupom que já informei o LANCHE2024!',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  } else if (clickCount == 38) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Easter Egg ativado *2! 🍀',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );

                    Navigator.pushNamed(context, 'promo2');
                  }
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOut, // Suaviza a transição de movimento
                transform: Matrix4.translationValues(0,
                    clickCount >= 4 ? -20 : 0, 0), // Move o círculo para cima
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
