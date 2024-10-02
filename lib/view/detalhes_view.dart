// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import '../model/pratos_model.dart';

class DetalhesView extends StatefulWidget {
  const DetalhesView({super.key});

  @override
  State<DetalhesView> createState() => _DetalhesViewState();
}

class _DetalhesViewState extends State<DetalhesView> {
  int quantidade = 1; // Contador para a quantidade do prato

  @override
  Widget build(BuildContext context) {
    // Recuperar os dados do Prato
    Prato dados = ModalRoute.of(context)!.settings.arguments as Prato;

    // Pega a largura da tela
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Prato'),
        backgroundColor: Color(0xFFFFD600), // Mantendo a cor da AppBar
      ),
      body: Container(
        color: Colors.yellow, // Fundo alterado para amarelo
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              // Imagem do prato
              ImageNetwork(
                image: dados.foto,
                height: 200,
                width: screenWidth, // Usando a largura da tela para a imagem
                fitWeb: BoxFitWeb.cover, // A imagem cobre a largura com proporção mantida
                onLoading: const CircularProgressIndicator(
                  color: Colors.indigoAccent,
                ),
              ),

              SizedBox(height: 20),

              // Nome do prato
              ListTile(
                title: Text(
                  'Nome',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  dados.nome,
                  style: TextStyle(fontSize: 22),
                ),
              ),

              // Preço do prato
              ListTile(
                title: Text(
                  'Preço',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  dados.preco, // Exibindo o preço em formato monetário
                  style: TextStyle(fontSize: 22),
                ),
              ),

              // Descrição do prato
              ListTile(
                title: Text(
                  'Descrição',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  dados.descricao,
                  style: TextStyle(fontSize: 22),
                ),
              ),

              SizedBox(height: 20),

              // Contador de quantidade
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quantidade: $quantidade',
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (quantidade > 1) {
                              quantidade--;
                            }
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            quantidade++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Botão de adicionar ao pedido
              ElevatedButton(
                onPressed: () {
                  // Aqui você pode implementar a lógica para adicionar o prato ao pedido
                  // Ex: Navigator.pop(context);
                  // Exibir um snackbar ou diálogo
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Adicionado ${quantidade} ${dados.nome}(s) ao pedido!'),
                    ),
                  );
                },
                child: Text('Adicionar ao Pedido'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFD600), // Cor do botão
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}