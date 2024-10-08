/* RF004 Detalhes do Item
●	Apresentação detalhada dos itens do cardápio, incluindo imagem, nome, descrição completa e preço
●	Adicionar item ao pedido.
*/

class Prato {
  // Atributos
  final String nome;
  final String descricao;
  final String preco;
  final String foto;
  final String resumo;

  // Construtor
  Prato(
    this.nome,
    this.descricao,
    this.preco,
    this.foto,
    this.resumo,
  );

  //
  // Método para geração de Entradas
  //
  static List<Prato> gerarEntradas() {
    List<Prato> lista = [];
    lista.add(Prato(
      'Onion Rings',
      'Anéis de cebola empanados e fritos, crocantes',
      'R\$ 10,50',
      'lib/images/onion rings.png',
      '10 pedaços | 300g',
    ));
    lista.add(Prato(
      "Nuggets",
      "Nuggets de frango empanados, crocantes por fora e suculentos por dentro",
      'R\$ 10,50',
      "lib/images/nuggets.jpg",
      '10 pedaços | 300g',
    ));
    lista.add(Prato(
      "Batata Frita G",
      "Batatas fritas crocantes e temperadas",
      'R\$ 15,50',
      "lib/images/french fries.jpg",
      '14 pedaços | 400g',
    ));
    lista.add(Prato(
      "Combo Onions & Batato Frango Fritas",
      "Anéis de cebola & Frango e Batatas fritas crocantes e temperadas num combo com maionese ketchup + molhos especiais + molhos separados de mostarda e mel + barbecue + cebola crua",
      'R\$ 35,50',
      "lib/images/onions_batatas.png",
      'Sortidos 1/3 de onions + 1/3 de batatas + 1/3 de frango empanado| 1,1 kg',
    ));
    return lista;
  }

  //
  // Método para geração de Pratos Principais
  //
  static List<Prato> gerarPratosPrincipais() {
    List<Prato> lista = [];
    lista.add(Prato(
      'Balde de Frango G',
      'Frango marinado em especiarias, frito até a perfeição',
      'R\$ 15,50',
      'lib/images/frango_balde.jpeg',
      '14 pedaços | 400g',
    ));
    lista.add(Prato(
      'X - White',
      'Peito de frango empanado, com queijo e molho especial',
      'R\$ 15,50',
      'lib/images/frango_white.jfif',
      '14 pedaços | 400g',
    ));
    lista.add(Prato(
      "X - Heisenberg",
      "Frango grelhado com especiarias e molho picante",
      'R\$ 13,50',
      "lib/images/los-polos-hermanos14.png",
      '12 pedaços | 350g',
    ));
    return lista;
  }

  //
  // Método para geração de Bebidas
  //
  static List<Prato> gerarBebidas() {
    List<Prato> lista = [];
    lista.add(Prato(
      "Refrigerante Soda",
      "Refrigerante Soda 350ml gelado para acompanhar seu prato",
      'R\$ 5,00',
      "lib/images/soda.jpg",
      '350ml',
    ));
    lista.add(Prato(
      "Refrigerante Coca",
      "Refrigerante Coca 350ml gelado para acompanhar seu prato",
      'R\$ 5,00',
      "lib/images/coke.jpg",
      '350ml',
    ));
    lista.add(Prato(
      "Água c/gás",
      "Água mineral com gás, refrescante",
      'R\$ 3,00',
      "lib/images/agua-com-gas-500ml.jpg",
      '500ml',
    ));
    lista.add(Prato(
      "Água s/gás",
      "Água mineral natural, perfeita para hidratação",
      'R\$ 2,50',
      "lib/images/agua_sem_gas.jpg",
      '500ml',
    ));
    lista.add(Prato(
      "Suco Dell Valle",
      "Suco natural de frutas, refrescante e saudável",
      'R\$ 5,50',
      "lib/images/suco_delvale.jpg",
      '350ml',
    ));
    return lista;
  }

  //
  // Método para geração de Sobremesas
  //
  static List<Prato> gerarSobremesas() {
    List<Prato> lista = [];
    lista.add(Prato(
      "Cheesecake",
      "Delicioso cheesecake com cobertura de frutas vermelhas",
      'R\$ 12,00',
      "lib/images/cheesecake.jpg",
      '1 fatia',
    ));
    lista.add(Prato(
      "Brownie",
      "Brownie de chocolate com nozes",
      'R\$ 8,00',
      "lib/images/brownie.jpg",
      '1 pedaço',
    ));
    return lista;
  }
}
