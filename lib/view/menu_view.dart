// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import '../model/pratos_model.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  List<Prato> lista = [];
  int _selectedIndex = 0; // Índice do item selecionado no BottomNavigationBar
  String query = '';

  @override
  void initState() {
    // Preencher a lista com os Pratos
    lista = Prato.gerarDados();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Atualiza o índice selecionado
    });

    // Navegar para outras telas
    switch (index) {
      case 0:
        // Menu - já estamos nesta tela
        break;
      case 1:
        Navigator.pushNamed(context, 'categorias'); // Navega para a tela de Categorias
        break;
      case 2:
        Navigator.pushNamed(context, 'perfil'); // Navega para a tela de Perfil
        break;
      case 3:
        Navigator.pushNamed(context, 'configuracoes'); // Navega para a tela de Configurações
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD600),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFD600),
        title: Container(

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/sand.jpeg'),
              fit: BoxFit.cover,
            ),
          ),

          height: 40,
          child: TextField(
            onChanged: (value) {
              setState(() {
                query = value; // Atualiza a query conforme o usuário digita
              });
            },
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          // Filtrar a lista com base na query
          itemCount: lista.where((prato) {
            return prato.nome.toLowerCase().contains(query.toLowerCase());
          }).length,
          itemBuilder: (context, index) {
            final prato = lista.where((prato) {
              return prato.nome.toLowerCase().contains(query.toLowerCase());
            }).toList()[index]; // Filtra a lista com a query
            return Card(
              margin: EdgeInsets.all(10), // Espaçamento entre os cards
              elevation: 5,
              child: InkWell(
                onTap: () {
                  // Abrir a DetalhesView
                  var pratoSelecionado = lista[index];
                  Navigator.pushNamed(
                    context,
                    'detalhes',
                    arguments: pratoSelecionado,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Imagem
                      Container(
                        height: 100,
                        width: 100, // Ajustado para um tamanho mais adequado
                        child: ImageNetwork(
                          image: prato.foto,
                          height: 100,
                          width: 100,
                          fitWeb: BoxFitWeb.cover,
                          onLoading: const CircularProgressIndicator(
                            color: Colors.indigoAccent,
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Espaçamento entre imagem e texto
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Alinhar à esquerda
                          children: [
                            Text(
                              prato.nome,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${prato.descricao}\n${prato.preco}",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_right), // Ícone à direita
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
       bottomNavigationBar: BottomAppBar(
        color: Color(0xFFFFD600),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                setState(() {
                  _selectedIndex = 0; // Altere o índice conforme necessário
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.category),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}