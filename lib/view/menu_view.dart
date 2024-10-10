import 'package:flutter/material.dart';
import 'package:preojeto/model/user_model.dart';
import '../model/itens_model.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  List<Prato> listaEntradas = [];
  List<Prato> listaPratosPrincipais = [];
  List<Prato> listaBebidas = [];
  List<Prato> listaSobremesas = [];
  String query = ''; // Termo de pesquisa
  int _currentIndex = 0; // Para controlar a navegação

  @override
  void initState() {
    super.initState();

    // Preencher as listas com os Pratos organizados por categoria
    listaEntradas = Prato.gerarEntradas();
    listaPratosPrincipais = Prato.gerarPratosPrincipais();
    listaBebidas = Prato.gerarBebidas();
    listaSobremesas = Prato.gerarSobremesas();
  }

  // Função para filtrar os itens com base na pesquisa
  List<Prato> filtrarPratos(List<Prato> pratos, String query) {
    return pratos.where((prato) {
      final nomePratoLower = prato.nome.toLowerCase();
      final searchLower = query.toLowerCase();
      return nomePratoLower.contains(searchLower);
    }).toList();
  }

  // Função para alternar entre diferentes telas da BottomNavigationBar
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      // Lógica para a tela de Menu
    } else if (index == 1) {
      // Navegar para a tela de categorias
      Navigator.pushNamed(context, 'categorias');
    } else if (index == 2) {
      // Aqui você pode passar o e-mail do usuário logado para buscar suas informações
      String emailUsuario =
          "email_do_usuario_logado"; // Troque pelo método que você usa para obter o email

      // Recuperar o usuário através da função buscarUsuarioPorEmail
      Usuario? usuario = Usuario.buscarUsuarioPorEmail(emailUsuario);

      // Verifique se o usuário foi encontrado
      if (usuario != null) {
        Navigator.pushNamed(
          context,
          'perfil',
          arguments: {
            'nome': usuario.nome,
            'email': usuario.email,
            'senha': usuario.senha,
          },
        );
      } else {
        // Tratamento caso o usuário não seja encontrado
        print('Usuário não encontrado');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filtrar os itens com base na query de pesquisa
    final entradasFiltradas = filtrarPratos(listaEntradas, query);
    final pratosPrincipaisFiltrados =
        filtrarPratos(listaPratosPrincipais, query);
    final bebidasFiltradas = filtrarPratos(listaBebidas, query);
    final sobremesasFiltradas = filtrarPratos(listaSobremesas, query);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove o botão de voltar
        backgroundColor: Color(0xFFFFD600),
        title: Row(
          children: [
            Expanded(
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
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            // Entradas
            if (entradasFiltradas.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Entradas',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              ...entradasFiltradas.map((prato) => Card(
                    margin: EdgeInsets.all(10), // Espaçamento entre os cards
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Raio dos cantos
                      side: BorderSide(
                        color: Color(0xFF757575), // Cor da borda (cinza)
                        width: 1.0, // Largura da borda
                      ),
                    ),
                    child: SizedBox(
                      height: 100, // Altura do card
                      child: ListTile(
                        leading: SizedBox(
                          width: 100, // Largura da imagem
                          height: 100, // Altura da imagem para preencher o card
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                10), // Opcional: arredonda as bordas da imagem
                            child: Image.network(
                              prato.foto,
                              fit: BoxFit
                                  .cover, // Ajusta a imagem para cobrir a área
                            ),
                          ),
                        ),
                        title: Text(prato.nome),
                        subtitle: Text(prato.preco),
                        trailing: Icon(Icons.play_arrow_rounded,
                            size: 22), // Ícone modificado
                        onTap: () {
                          Navigator.pushNamed(context, 'detalhes',
                              arguments: prato);
                        },
                      ),
                    ),
                  )),
            ],

            SizedBox(height: 20),

            // Pratos Principais
            if (pratosPrincipaisFiltrados.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Pratos Principais',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              ...pratosPrincipaisFiltrados.map((prato) => Card(
                    margin: EdgeInsets.all(10),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Raio dos cantos
                      side: BorderSide(
                        color: Color(0xFF757575), // Cor da borda (cinza)
                        width: 1.0, // Largura da borda
                      ),
                    ),
                    child: SizedBox(
                      height: 100, // Altura do card
                      child: ListTile(
                        leading: SizedBox(
                          width: 80, // Largura da imagem
                          height: 80, // Altura da imagem para preencher o card
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              prato.foto,
                              fit: BoxFit
                                  .cover, // Ajusta a imagem para cobrir a área
                            ),
                          ),
                        ),
                        title: Text(prato.nome),
                        subtitle: Text(prato.preco),
                        trailing: Icon(Icons.play_arrow_rounded,
                            size: 22), // Ícone modificado
                        onTap: () {
                          Navigator.pushNamed(context, 'detalhes',
                              arguments: prato);
                        },
                      ),
                    ),
                  )),
            ],

            SizedBox(height: 50),

            // Bebidas
            if (bebidasFiltradas.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Bebidas',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              ...bebidasFiltradas.map((prato) => Card(
                    margin: EdgeInsets.all(10),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Raio dos cantos
                      side: BorderSide(
                        color: Color(0xFF757575), // Cor da borda (cinza)
                        width: 1.0, // Largura da borda
                      ),
                    ),
                    child: SizedBox(
                      height: 100, // Altura do card
                      child: ListTile(
                        leading: SizedBox(
                          width: 80, // Largura da imagem
                          height: 80, // Altura da imagem para preencher o card
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              prato.foto,
                              fit: BoxFit
                                  .cover, // Ajusta a imagem para cobrir a área
                            ),
                          ),
                        ),
                        title: Text(prato.nome),
                        subtitle: Text(prato.preco),
                        trailing: Icon(Icons.play_arrow_rounded,
                            size: 22), // Ícone modificado
                        onTap: () {
                          Navigator.pushNamed(context, 'detalhes',
                              arguments: prato);
                        },
                      ),
                    ),
                  )),
            ],

            SizedBox(height: 50),

            // Sobremesas
            if (sobremesasFiltradas.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Sobremesas',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              ...sobremesasFiltradas.map((prato) => Card(
                    margin: EdgeInsets.all(10),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Raio dos cantos
                      side: BorderSide(
                        color: Color(0xFF757575), // Cor da borda (cinza)
                        width: 1.0, // Largura da borda
                      ),
                    ),
                    child: SizedBox(
                      height: 100, // Altura do card
                      child: ListTile(
                        leading: SizedBox(
                          width: 80, // Largura da imagem
                          height: 80, // Altura da imagem para preencher o card
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              prato.foto,
                              fit: BoxFit
                                  .cover, // Ajusta a imagem para cobrir a área
                            ),
                          ),
                        ),
                        title: Text(prato.nome),
                        subtitle: Text(prato.preco),
                        trailing: Icon(Icons.play_arrow_rounded,
                            size: 22), // Ícone modificado
                        onTap: () {
                          Navigator.pushNamed(context, 'detalhes',
                              arguments: prato);
                        },
                      ),
                    ),
                  )),
            ],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categorias'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adiciona lógica de logout aqui, como limpar o estado de autenticação ou sessão do usuário.
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Deslogando...\nDirecionado para a página de Login!'),
            ),
          );

          // Após o logout, navega para a tela de login.
          Future.delayed(Duration(seconds: 2), () {
            Navigator.pushReplacementNamed(context, 'login');
          });
        },
        child: Icon(Icons.logout), // Ícone de logout
        backgroundColor: Colors.red, // Cor do botão de logout
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.endDocked, // Localização do botão
    );
  }
}
