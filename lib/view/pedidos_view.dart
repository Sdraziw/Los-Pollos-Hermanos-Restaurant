/* RF005 Resumo do Pedido
●	Exibição dos itens do pedido, incluindo nome, quantidade, preço unitário e preço total.
●	Permitir alterar a quantidade ou remover itens do pedido.
●	Exibição do total geral e botão para confirmar pedido.
*/
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../services/pedido_service.dart'; // Importar o serviço de pedidos

class PedidosView extends StatelessWidget {
  final pedidoService = GetIt.I<PedidoService>(); // Acessando o serviço de pedidos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
        backgroundColor: Color(0xFFFFD600),
      ),
      body: ListView.builder(
        itemCount: pedidoService.pedidos.length,
        itemBuilder: (context, index) {
          final prato = pedidoService.pedidos[index];
          return ListTile(
            title: Text(prato.nome),
            subtitle: Text('Preço: ${prato.preco}'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () {
              // Lógica para confirmar o pedido
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Pedido confirmado!')),
              );
            },
            child: Text('Confirmar Pedido'),
          ),
        ),
      ),
    );
  }
}
