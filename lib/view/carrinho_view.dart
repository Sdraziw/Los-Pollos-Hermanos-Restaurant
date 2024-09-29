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
  @override
  Widget build(BuildContext context) {
    //
    // Recuperar os dados do Contato
    //
    Prato dados = ModalRoute.of(context)!.settings.arguments as Prato;

    return Scaffold(
      appBar: AppBar(
        title: Text('ContatosApp'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            
            ImageNetwork(
              image: dados.foto,
              height: 200,
              width: 200, 
              borderRadius: BorderRadius.circular(100),
              curve: Curves.easeIn,
              fitWeb: BoxFitWeb.cover,
              onLoading: const CircularProgressIndicator(
                color: Colors.indigoAccent,
              ), 
            ),

            ListTile(
              title: Text(
                'Nome',
                style: TextStyle(fontSize: 12),
              ),
              subtitle: Text(
                dados.nome,
                style: TextStyle(fontSize: 22),
              ),
            ),

            ListTile(
              title: Text(
                'Email',
                style: TextStyle(fontSize: 12),
              ),
              subtitle: Text(
                dados.preco,
                style: TextStyle(fontSize: 22),
              ),
            ),

            ListTile(
              title: Text(
                'Telefone',
                style: TextStyle(fontSize: 12),
              ),
              subtitle: Text(
                dados.descricao,
                style: TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}