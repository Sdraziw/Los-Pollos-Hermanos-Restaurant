import 'package:flutter/material.dart';
import 'dart:math'; // Para gerar número aleatório

class PagamentoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Gerar um número de pedido aleatório de 4 dígitos
    final int numeroPedido = Random().nextInt(9000) + 1000; // Gera um número entre 1000 e 9999

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagamento'),
        backgroundColor: Color(0xFFFFD600),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Exibir o número do pedido
            Text(
              'Número do Pedido: #$numeroPedido',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20), // Espaçamento entre o texto e a imagem
            // Exibir a imagem
            Image.asset(
              'lib/images/embrulhos.jpg', // Caminho da imagem
              fit: BoxFit.cover,
              width: 300, // Ajuste a largura conforme necessário
            ),
            SizedBox(height: 20), // Espaçamento entre a imagem e o ícone
            // Ícone de dinheiro
            Icon(
              Icons.attach_money,
              size: 48,
              color: Colors.green, // Cor do ícone
            ),
            SizedBox(height: 20), // Espaçamento entre o ícone e o botão
            // Botão para pagar antecipadamente
            ElevatedButton(
              onPressed: () {
                // Ação ao pressionar o botão
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Pagamento para retirada confirmado!'),
                  ),
                );
              },
              child: Text('Pagar Antecipadamente'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                textStyle: TextStyle(fontSize: 18),
                backgroundColor: Color(0xFFFFD600),
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
