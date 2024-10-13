import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:preojeto/model/user_model.dart'; // Certifique-se de que esse caminho está correto

class ZZZView extends StatefulWidget {
  const ZZZView({super.key});

  @override
  State<ZZZView> createState() => _ZZZViewState();
}

class _ZZZViewState extends State<ZZZView> {
  /*var nomeAtual = '';
  var emailAtual = '';
  var senhaAtual = '';

  // Função que verifica se há usuários e preenche com dados de teste se necessário
  void checaUser() {
    if (Usuario.usuarios.isNotEmpty) {
      nomeAtual = Usuario.usuarios[0].nome;
      emailAtual = Usuario.usuarios[0].email;
      senhaAtual = Usuario.usuarios[0].senha;
    }
  }*/

  int _currentIndex = 1; // Para controlar a navegação

  // Função para alternar entre diferentes telas da BottomNavigationBar
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      // Lógica para a tela de Menu
      Navigator.pushNamed(context, 'menu');
    } else if (index == 1) {
      // Navegar para a tela de categorias
      Navigator.pushNamed(context, 'categorias');
    } else if (index == 2) {
      Navigator.pushNamed(context, 'perfil');
    }
  }

  /*@override
  void initState() {
    super.initState();
    checaUser(); // Chama a função para verificar e preencher os dados do usuário
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove o botão de voltar
        backgroundColor: Color(0xFFFFD600),
        title: Column(
          children: [
            Row(
              children: [
                /*Expanded(
                  // campo de pesquisa (lupa)
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          query =
                              value; // Atualiza a query conforme o usuário digita
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Digite aqui para pesquisar...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              30.0), // Arredondar a barra de pesquisa
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.black),
                  onPressed: () {
                    // Navegar para a tela do carrinho de compras
                    Navigator.pushNamed(context, 'pedidos');
                  },
                ),*/
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 80, 50, 10),
        child: Column(
          children: [
            /*SizedBox(
              height: 150,
              width: 150,
              child: ImageNetwork(
                image:
                    'lib/images/perfil_foto.png', // Certifique-se de que essa imagem existe
                height: 150,
                width: 150,
                borderRadius: BorderRadius.circular(100),
                curve: Curves.easeIn,
                fitWeb: BoxFitWeb.cover,
                onLoading: const CircularProgressIndicator(
                  color: Colors.indigoAccent,
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextFormField(
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              readOnly: true,
              initialValue: nomeAtual,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Nome',
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              readOnly: true,
              initialValue: emailAtual,
              decoration: InputDecoration(
                labelText: 'E-mail',
                filled: true,
                fillColor: Colors.white,
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              readOnly: true,
              initialValue: senhaAtual,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Senha',
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                minimumSize: const Size(150, 60),
                maximumSize: const Size(150, 70),
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'Deslogando...\nDirecionado para a página de Login!'),
                  ),
                );

                // Após o logout, navega para a tela de login.
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pushReplacementNamed(context, 'login');
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Sair'),
                  SizedBox(width: 15),
                  Icon(Icons.logout),
                ],
              ),
            ),*/
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        backgroundColor: const Color(0xFFFFD600),
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: 'Pedidos'), //Utilizado Direto no Menu
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
