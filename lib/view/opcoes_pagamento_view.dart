import 'package:flutter/material.dart';

class OpcoesPagamentoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha uma Opção de Pagamento'),
        backgroundColor: Color(0xFFFFD600),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ícone e botão para pagamento via Pix
            GestureDetector(
              onTap: () {
                // Lógica para pagamento via Pix
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Pagamento via Pix confirmado!\nAguarde, seu pedido está sendo preparado!'),
                  ),
                );
              },
              child: Column(
                children: [
                  Icon(Icons.payment, size: 60, color: Colors.blue), // Ícone de Pix
                  SizedBox(height: 10),
                  Text('Pagamento via Pix', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            SizedBox(height: 40), // Espaçamento entre opções
            // Ícone e botão para pagamento via cartão de crédito
            GestureDetector(
              onTap: () {
                // Lógica para pagamento via cartão de crédito
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Pagamento via Cartão de Crédito confirmado!\nAguarde, seu pedido está sendo preparado!'),
                  ),
                );
              },
              child: Column(
                children: [
                  Icon(Icons.credit_card, size: 60, color: Colors.green), // Ícone de cartão de crédito
                  SizedBox(height: 10),
                  Text('Pagamento via Cartão de Crédito', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
