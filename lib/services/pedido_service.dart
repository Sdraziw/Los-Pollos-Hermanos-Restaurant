import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import '../model/itens_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PedidoService {
  static const String _numeroPedidoKey = 'numeroPedido';

  // Registrar o serviço
  static void setup() {
    getIt.registerLazySingleton<PedidoService>(() => PedidoService());
    final logger = Logger();
    logger.d('PedidoService registrado: ${getIt<PedidoService>()}'); // Mensagem de depuração
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

  Future<void> logToFile(String message) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/app.log');
    await file.writeAsString('$message\n', mode: FileMode.append);
  }

  Future<void> setupWithSnackbar(BuildContext context) async {
    // Apenas para registrar com Snackbar, se necessário
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PedidoService registrado: ${getIt<PedidoService>()}'),
      ),
    );

    await logToFile('PedidoService registrado: ${getIt<PedidoService>()}'); // Registra no arquivo
  }
}

// Registrar o serviço
final getIt = GetIt.instance;

// Função de configuração do serviço
void setup() {
  PedidoService.setup();
}
