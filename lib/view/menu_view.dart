// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_element, unused_field

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
  Map<int, int> quantidade = {}; // Mapa para armazenar a quantidade de cada prato

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

  void _adicionarItem(int index) {
    setState(() {
      quantidade[index] = (quantidade[index] ?? 0) + 1; // Adiciona 1 à quantidade
    });
  }

  void _subtrairItem(int index) {
    setState(() {
      if (quantidade[index] != null && quantidade[index]! > 0) {
        quantidade[index] = quantidade[index]! - 1; // Subtrai 1 da quantidade
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD600),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFD600),
        title: Container(
          height: 40,
          child: TextField(
            onChanged: (value) {
              setState(() {
                query = value; // Atualiza a query conforme o usuário digita
              });
            },
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: 'Pesquisar...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0), // Arredondar a barra de pesquisa
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Alinhar à esquerda
                  children: [
                    Row(
                      children: [
                        // Imagem
                        SizedBox(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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

                              SizedBox(height: 1),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () => _subtrairItem(index),
                                  ),

                                  SizedBox(width: 10),

                                  Text('${quantidade[index] ?? 0}', style: TextStyle(fontSize: 18)), // Mostra a quantidade
                                  
                                  SizedBox(width: 10),
                                  
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () => _adicionarItem(index),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0), // Espaço entre a descrição e os botões
                    // Adiciona os botões de adição e subtração
                    
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFFFD600), // Cor da BottomAppBar
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