import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../services/pedido_service.dart';

class HistoricoView extends StatefulWidget {
  @override
  _HistoricoViewState createState() => _HistoricoViewState();
}

class _HistoricoViewState extends State<HistoricoView> {
  List<String> historico = [];

  @override
  void initState() {
    super.initState();
    carregarHistorico();
  }

  Future<void> carregarHistorico() async {
    try {
      historico = await getIt<PedidoService>().obterHistorico();
      setState(() {});
    } catch (e) {
      print('Erro ao carregar histórico: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Pedidos'),
        backgroundColor: Color(0xFFFFD600),
      ),
      body: historico.isEmpty
          ? Center(child: Text('Faça um pedido primeiramente.'))
          : ListView.builder(
              itemCount: historico.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(historico[index]),
                );
              },
            ),
    );
  }
}
