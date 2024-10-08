/* RF003 Visualização do Cardápio
●	Exibição do cardápio de forma organizada.
●	Divisão do cardápio em categorias.
●	Apresentação dos itens de cada categoria
*/

import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    // Filtrar os itens com base na query de pesquisa
    final entradasFiltradas = filtrarPratos(listaEntradas, query);
    final pratosPrincipaisFiltrados = filtrarPratos(listaPratosPrincipais, query);
    final bebidasFiltradas = filtrarPratos(listaBebidas, query);
    final sobremesasFiltradas = filtrarPratos(listaSobremesas, query);

    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove o botão de voltar
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
        child: ListView(
          children: [
            // Entradas
            if (entradasFiltradas.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Entradas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              ...entradasFiltradas.map((prato) => Card(
                margin: EdgeInsets.all(10), // Espaçamento entre os cards
                elevation: 5,
                child: ListTile(
                  leading: Image.network(prato.foto, width: 50, height: 50),
                  title: Text(prato.nome),
                  subtitle: Text(prato.preco),
                  onTap: () {
                    Navigator.pushNamed(context, 'detalhes', arguments: prato);
                  },
                ),
              )).toList(),
            ],

            // Pratos Principais
            if (pratosPrincipaisFiltrados.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Pratos Principais', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              ...pratosPrincipaisFiltrados.map((prato) => Card(
                margin: EdgeInsets.all(10),
                elevation: 5,
                child: ListTile(
                  leading: Image.network(prato.foto, width: 50, height: 50),
                  title: Text(prato.nome),
                  subtitle: Text(prato.preco),
                  onTap: () {
                    Navigator.pushNamed(context, 'detalhes', arguments: prato);
                  },
                ),
              )).toList(),
            ],

            // Bebidas
            if (bebidasFiltradas.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Bebidas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              ...bebidasFiltradas.map((prato) => Card(
                margin: EdgeInsets.all(10),
                elevation: 5,
                child: ListTile(
                  leading: Image.network(prato.foto, width: 50, height: 50),
                  title: Text(prato.nome),
                  subtitle: Text(prato.preco),
                  onTap: () {
                    Navigator.pushNamed(context, 'detalhes', arguments: prato);
                  },
                ),
              )).toList(),
            ],

            // Sobremesas
            if (sobremesasFiltradas.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Sobremesas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              ...sobremesasFiltradas.map((prato) => Card(
                margin: EdgeInsets.all(10),
                elevation: 5,
                child: ListTile(
                  leading: Image.network(prato.foto, width: 50, height: 50),
                  title: Text(prato.nome),
                  subtitle: Text(prato.preco),
                  onTap: () {
                    Navigator.pushNamed(context, 'detalhes', arguments: prato);
                  },
                ),
              )).toList(),
            ],
          ],
        ),
      ),
    );
  }
}
