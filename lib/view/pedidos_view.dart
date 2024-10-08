/* RF005 Resumo do Pedido
●	Exibição dos itens do pedido, incluindo nome, quantidade, preço unitário e preço total.
●	Permitir alterar a quantidade ou remover itens do pedido.
●	Exibição do total geral e botão para confirmar pedido.
*/

import 'package:flutter/material.dart';
import '../model/itens_model.dart';

class PedidosView extends StatelessWidget {
  final List<Prato> pedidos;

  PedidosView({super.key, required this.pedidos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
        backgroundColor: Color(0xFFFFD600),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: pedidos.length,
          itemBuilder: (context, index) {
            final prato = pedidos[index];
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(prato.nome),
                subtitle: Text(prato.preco),
              ),
            );
          },
        ),
      ),
    );
  }
}
