//import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/itens_model.dart';

class PedidoService {
  static const String _numeroPedidoKey = 'numeroPedido';
  static const String _historicoKey = 'historicoPedidos';

  // Registrar o serviço
  static void setup() {
    getIt.registerLazySingleton<PedidoService>(() => PedidoService());
  }

  Future<String> gerarNumeroPedido() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int numeroPedido = prefs.getInt(_numeroPedidoKey) ?? 0;
    numeroPedido++;
    await prefs.setInt(_numeroPedidoKey, numeroPedido);
    return numeroPedido.toString().padLeft(4, '0');
  }

  final List<Prato> _pedidos = [];
  List<Prato> get pedidos => _pedidos;

  void adicionarAoPedido(Prato prato) {
    _pedidos.add(prato);
  }

  void removerDoPedido(Prato prato) {
    _pedidos.remove(prato);
  }

  void limparPedido() {
    _pedidos.clear();
  }

  Future<void> registrarHistorico(String numeroPedido) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> historico = prefs.getStringList(_historicoKey) ?? [];

    // Adiciona o histórico com o número do pedido
    historico.add(
        'Pedido: $numeroPedido - Status: ${_pedidos.first.status} - Itens: ${_pedidos.map((prato) => prato.nome).join(", ")}');

    await prefs.setStringList(_historicoKey, historico);
    limparPedido(); // Limpa o pedido após registrar
  }

  Future<List<String>> obterHistorico() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_historicoKey) ?? [];
  }
}

// Registrar o serviço
final getIt = GetIt.instance;

// Função de configuração do serviço
void setup() {
  PedidoService.setup();
}
