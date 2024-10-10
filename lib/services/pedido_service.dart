import 'package:get_it/get_it.dart';
import '../model/itens_model.dart';

class PedidoService {
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
}

// Registrar o serviço
final getIt = GetIt.instance;

// Função de configuração do serviço
void setup() {
  print('Configuração do PedidoService'); // Para depuração
  getIt.registerLazySingleton<PedidoService>(() => PedidoService());
}
