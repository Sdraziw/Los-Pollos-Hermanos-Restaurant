import 'package:flutter/material.dart';

class PagamentoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagamento'),
        backgroundColor: Color(0xFFFFD600),
      ),
      body: Center(
        child: Image.asset(
          'lib/images/embrulhos.jpg', // Caminho da imagem
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
