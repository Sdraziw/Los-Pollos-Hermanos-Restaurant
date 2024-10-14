import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/itens_model.dart';

class PedidoService {
  static const String _numeroPedidoKey = 'numeroPedido';
  static const String _historicoKey = 'historicoPedidos';

  // Lista de pratos no pedido atual
  final List<Prato> _pedidos = [];
  List<Prato> get pedidos => _pedidos;

  // Registrar o serviço no GetIt
  static void setup() {
    getIt.registerLazySingleton<PedidoService>(() => PedidoService());
  }

  // Gera um número de pedido único e incrementa o contador de pedidos
  Future<String> gerarNumeroPedido() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int numeroPedido = prefs.getInt(_numeroPedidoKey) ?? 0;
    numeroPedido++;
    await prefs.setInt(_numeroPedidoKey, numeroPedido);
    return numeroPedido.toString().padLeft(4, '0');
  }

  // Adiciona um prato ao pedido
  void adicionarAoPedido(Prato prato) {
    _pedidos.add(prato);
  }

  // Remove um prato do pedido
  void removerDoPedido(Prato prato) {
    _pedidos.remove(prato);
  }

  // Limpa o pedido atual
  void limparPedido() {
    _pedidos.clear();
  }

  // Registra o histórico do pedido
  Future<void> registrarHistorico(String numeroPedido) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> historico = prefs.getStringList(_historicoKey) ?? [];

    // Adiciona o histórico com o número do pedido, status e itens do pedido
    historico.add(
        'Pedido: $numeroPedido - Status: ${_pedidos.isNotEmpty ? _pedidos.first.status : 'Desconhecido'} - Itens: ${_pedidos.map((prato) => prato.nome).join(", ")}');

    // Armazena o histórico atualizado
    await prefs.setStringList(_historicoKey, historico);
    limparPedido(); // Limpa o pedido após o registro no histórico
  }

  // Obtém o histórico de pedidos
  Future<List<String>> obterHistorico() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_historicoKey) ?? [];
  }
}

// Registrar o serviço no GetIt
final getIt = GetIt.instance;

// Função de configuração do serviço
void setupservice() {
  PedidoService.setup();
}
