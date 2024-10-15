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
  List<Prato> listaBaldes = [];
  String query = '';
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    //optamos náo usar ListView.builder

    // Preencher as listas com os Pratos organizados por categoria
    listaEntradas = Prato.gerarEntradas();
    listaPratosPrincipais = Prato.gerarPratosPrincipais();
    listaBebidas = Prato.gerarBebidas();
    listaSobremesas = Prato.gerarSobremesas();
    listaBaldes = Prato.gerarBaldes();
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
      Navigator.pushReplacementNamed(context, 'menu');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, 'historico');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, 'perfil');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    final entradasFiltradas = filtrarPratos(listaEntradas, query);
    final pratosPrincipaisFiltrados = filtrarPratos(listaPratosPrincipais, query);
    final bebidasFiltradas = filtrarPratos(listaBebidas, query);
    final sobremesasFiltradas = filtrarPratos(listaSobremesas, query);
    final baldesFiltrados = filtrarPratos(listaBaldes, query);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFD600),
        title: Column(
          children: [
            Row(
              children: [
                Expanded(
                  // campo de pesquisa (lupa)
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          query = value;
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Digite aqui para pesquisar...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
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
            SizedBox(height: 10),
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
                child: Text('Porções',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
               ...entradasFiltradas.map((prato) => Card(
                    margin: EdgeInsets.all(10),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      height: 100,
                      child: ListTile(
                        leading: SizedBox(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              prato.foto,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(prato.nome),
                        subtitle: Text(prato.preco, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        trailing: Icon(Icons.play_arrow_rounded, size: 22),
                        onTap: () {
                          Navigator.pushNamed(context, 'detalhes',
                              arguments: prato);
                        },
                      ),
                    ),
                  )),
            ],

            SizedBox(height: 50),

            // Baldes
            if (baldesFiltrados.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Baldes de Frango',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
               ...baldesFiltrados.map((prato) => Card(
                    margin: EdgeInsets.all(10),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      height: 100,
                      child: ListTile(
                        leading: SizedBox(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              prato.foto,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(prato.nome),
                        subtitle: Text(prato.preco, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        trailing: Icon(Icons.play_arrow_rounded, size: 22),
                        onTap: () {
                          Navigator.pushNamed(context, 'detalhes',
                              arguments: prato);
                        },
                      ),
                    ),
                  )),
            ],

            SizedBox(height: 50),

            // Pratos Principais
            if (pratosPrincipaisFiltrados.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Lanches',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              ...pratosPrincipaisFiltrados.map((prato) => Card(
                    margin: EdgeInsets.all(10),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      height: 100,
                      child: ListTile(
                        leading: SizedBox(
                          width: 80,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              prato.foto,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(prato.nome),
                        subtitle: Text(prato.preco, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        trailing: Icon(Icons.play_arrow_rounded, size: 22),
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
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      height: 100,
                      child: ListTile(
                        leading: SizedBox(
                          width: 80,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              prato.foto,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(prato.nome),
                        subtitle: Text(prato.preco, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        trailing: Icon(Icons.play_arrow_rounded, size: 22),
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
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      height: 100,
                      child: ListTile(
                        leading: SizedBox(
                          width: 80,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              prato.foto,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(prato.nome),
                        subtitle: Text(prato.preco, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        trailing: Icon(Icons.play_arrow_rounded, size: 22),
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
        fixedColor: Colors.black,
        backgroundColor: Color(0xFFFFD600),
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: 'Pedidos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
