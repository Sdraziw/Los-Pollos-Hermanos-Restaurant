import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../services/pedido_service.dart';
import '../model/itens_model.dart';

class PedidosView extends StatefulWidget {
  @override
  _PedidosViewState createState() => _PedidosViewState();
}

class _PedidosViewState extends State<PedidosView> {
  final pedidoService = GetIt.I<PedidoService>();
  bool incluirGorjeta = true; // Estado para controlar se a gorjeta de 10% será incluída
  double percentualGorjeta = 10.0; // Percentual de gorjeta padrão
  String mensagemErro = ''; // Armazenar a mensagem de erro

  @override
  Widget build(BuildContext context) {
    double totalPedido = calcularTotalPedido();
    double totalComGorjeta = incluirGorjeta ? totalPedido * (1 + (percentualGorjeta / 100)) : totalPedido;

    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
        backgroundColor: Color(0xFFFFD600),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: pedidoService.pedidos.length,
              itemBuilder: (context, index) {
                final prato = pedidoService.pedidos[index];
                return ListTile(
                  leading: Image.network(prato.foto, width: 50, height: 50), // Miniatura do produto
                  title: Text(prato.nome),
                  subtitle: Text('Preço: ${prato.preco}\nQuantidade: ${prato.quantidade}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (prato.quantidade > 1) {
                              prato.quantidade--;
                            } else {
                              confirmarRemoverItem(prato);
                            }
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            prato.quantidade++;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          confirmarRemoverItem(prato);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckboxListTile(
                  title: Text("Incluir gorjeta de $percentualGorjeta%"),
                  subtitle: Text("A gorjeta não é obrigatória."),
                  value: incluirGorjeta,
                  onChanged: (bool? value) {
                    setState(() {
                      incluirGorjeta = value!;
                    });
                  },
                ),
                if (incluirGorjeta) ...[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Alterar percentual da gorjeta',
                      hintText: 'Digite o percentual da gorjeta',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        // Verificar se a entrada contém apenas números, ponto ou vírgula
                        if (RegExp(r'^[0-9.,]+$').hasMatch(value)) {
                          mensagemErro = ''; // Nenhum erro
                          double? novoPercentual = double.tryParse(value.replaceAll(',', '.'));
                          if (novoPercentual != null && novoPercentual > 0) {
                            percentualGorjeta = novoPercentual;
                          } else {
                            percentualGorjeta = 10.0; // Valor padrão se a entrada for inválida
                          }
                        } else {
                          mensagemErro = 'Por favor, insira apenas números, ponto ou vírgula.'; // Exibir erro
                        }
                      });
                    },
                  ),
                  if (mensagemErro.isNotEmpty) // Exibir mensagem de erro se houver
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        mensagemErro,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                ],
                SizedBox(height: 10),
                Text(
                  'Total: R\$ ${totalPedido.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Reduzido o tamanho da fonte
                ),
                if (incluirGorjeta)
                  Text(
                    'Total com ${percentualGorjeta.toStringAsFixed(1)}% de gorjeta: R\$ ${totalComGorjeta.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), // Fonte menor para o total com gorjeta
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'pagamento', arguments: totalComGorjeta);
                  },
                  child: Text('Efetuar Pagamento'),
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
        ],
      ),
    );
  }

  // Função para calcular o total do pedido
  double calcularTotalPedido() {
    double total = 0;
    for (var item in pedidoService.pedidos) {
      total += item.quantidade * double.parse(item.preco.replaceAll('R\$ ', '').replaceAll(',', '.'));
    }
    return total;
  }

  // Função para confirmar a remoção de um item
  void confirmarRemoverItem(Prato prato) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Remover Item'),
        content: Text('Tem certeza que deseja remover "${prato.nome}" do pedido?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                pedidoService.removerDoPedido(prato);
              });
              Navigator.of(context).pop();
            },
            child: Text('Remover'),
          ),
        ],
      ),
    );
  }
}
