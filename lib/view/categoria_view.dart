import 'package:flutter/material.dart';
import '../model/itens_model.dart'; // Atualize o caminho conforme necessário

class CategoriaView extends StatelessWidget {
  const CategoriaView({super.key});

  @override
  Widget build(BuildContext context) {
    final String categoria = ModalRoute.of(context)!.settings.arguments as String;

    // Gerar a lista de pratos com base na categoria recebida
    List<Prato> pratos = [];

    // Seleciona a lista de pratos conforme a categoria
    if (categoria == 'entradas') {
      pratos = Prato.gerarEntradas();
    } else if (categoria == 'pratos') {
      pratos = Prato.gerarPratosPrincipais();
    } else if (categoria == 'bebidas') {
      pratos = Prato.gerarBebidas();
    } else if (categoria == 'sobremesas') {
      pratos = Prato.gerarSobremesas();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Categoria: $categoria'),
        backgroundColor: Color(0xFFFFD600),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Voltar à página anterior
          },
        ),
      ),
      body: ListView.builder(
        itemCount: pratos.length,
        itemBuilder: (context, index) {
          final prato = pratos[index];
          return ListTile(
            leading: Image.network(prato.foto, width: 50, height: 50),
            title: Text(prato.nome),
            subtitle: Text(prato.preco),
            onTap: () {
              Navigator.pushNamed(
                context,
                'detalhes',
                arguments: prato,
              );
            },
          );
        },
      ),
    );
  }
}
