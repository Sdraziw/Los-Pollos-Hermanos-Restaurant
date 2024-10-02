class Prato {
  // Atributos
  final String nome;
  final String descricao;
  final String preco;
  final String foto;
  final String resumo; // Novo atributo para resumo

  // Construtor
  Prato(
    this.nome,
    this.descricao,
    this.preco,
    this.foto,
    this.resumo, // Incluindo o novo atributo no construtor
  );

  //
  // Método para geração de Pratos
  //
  static List<Prato> gerarDados() {
    List<Prato> lista = [];
    lista.add(Prato(
      'Balde de Frango G',
      'Frango marinado em especiarias, frito até a perfeição',
      'R\$ 15,50',
      'lib/images/balde asinha.jpg',
      '14 pedaços | 400g', // Resumo
    ));
    lista.add(Prato(
      "Balde de Frango M",
      "Frango crocante, temperado com ervas",
      'R\$ 13,50',
      "lib/images/balde asinha.jpg",
      '12 pedaços | 350g', // Resumo
    ));
    lista.add(Prato(
      "Balde de Frango P",
      "Porção de frango suculento, frito e crocante",
      'R\$ 10,50',
      "lib/images/balde asinha.jpg",
      '10 pedaços | 300g', // Resumo
    ));
    lista.add(Prato(
      'X - White',
      'Peito de frango empanado, com queijo e molho especial',
      'R\$ 15,50',
      'lib/images/balde asinha.jpg',
      '14 pedaços | 400g', // Resumo
    ));
    lista.add(Prato(
      "X - Heisenberg",
      "Frango grelhado com especiarias e molho picante",
      'R\$ 13,50',
      "lib/images/balde asinha.jpg",
      '12 pedaços | 350g', // Resumo
    ));
    lista.add(Prato(
      "X - Jesse",
      "Peito de frango frito com queijo e alface crocante",
      'R\$ 10,50',
      "lib/images/balde asinha.jpg",
      '10 pedaços | 300g', // Resumo
    ));
    lista.add(Prato(
      'X - Gus',
      'Peito de frango marinado, grelhado com perfeição',
      'R\$ 15,50',
      'lib/images/balde asinha.jpg',
      '14 pedaços | 400g', // Resumo
    ));
    lista.add(Prato(
      "X - I'm the Danger",
      "Frango empanado crocante, com molho barbecue",
      'R\$ 13,50',
      "lib/images/balde asinha.jpg",
      '12 pedaços | 350g', // Resumo
    ));
    lista.add(Prato(
      "X - WW",
      "Sanduíche com peito de frango grelhado e maionese",
      'R\$ 10,50',
      "lib/images/balde asinha.jpg",
      '10 pedaços | 300g', // Resumo
    ));
    lista.add(Prato(
      'X - Hank',
      'Frango empanado, queijo derretido e picles',
      'R\$ 15,50',
      'lib/images/balde asinha.jpg',
      '14 pedaços | 400g', // Resumo
    ));
    lista.add(Prato(
      "X - Better Call Saul",
      "Frango grelhado com molho ranch e vegetais frescos",
      'R\$ 13,50',
      "lib/images/balde asinha.jpg",
      '12 pedaços | 350g', // Resumo
    ));
    lista.add(Prato(
      "X - The Fly",
      "Frango frito com queijo cheddar e cebolas caramelizadas",
      'R\$ 10,50',
      "lib/images/balde asinha.jpg",
      '10 pedaços | 300g', // Resumo
    ));
    lista.add(Prato(
      "X - Grey Matter",
      "Frango empanado com temperos secretos",
      'R\$ 10,50',
      "lib/images/balde asinha.jpg",
      '10 pedaços | 300g', // Resumo
    ));
    lista.add(Prato(
      "X - Blue Math",
      "Frango grelhado com queijo azul e molho especial",
      'R\$ 10,50',
      "lib/images/balde asinha.jpg",
      '10 pedaços | 300g', // Resumo
    ));
    lista.add(Prato(
      'Batata Frita G',
      'Batatas fritas crocantes e temperadas',
      'R\$ 15,50',
      'lib/images/balde asinha.jpg',
      '14 pedaços | 400g', // Resumo
    ));
    lista.add(Prato(
      "Batata Frita M",
      "Porção média de batatas fritas, sempre frescas",
      'R\$ 13,50',
      "lib/images/balde asinha.jpg",
      '12 pedaços | 350g', // Resumo
    ));
    lista.add(Prato(
      "Batata Frita P",
      "Batatas fritas crocantes para um lanche rápido",
      'R\$ 10,50',
      "lib/images/balde asinha.jpg",
      '10 pedaços | 300g', // Resumo
    ));
    lista.add(Prato(
      "Onion Rings",
      "Anéis de cebola empanados e fritos, crocantes",
      'R\$ 10,50',
      "lib/images/balde asinha.jpg",
      '10 pedaços | 300g', // Resumo
    ));
    lista.add(Prato(
      "Nuggets",
      "Nuggets de frango empanados, crocantes por fora e suculentos por dentro",
      'R\$ 10,50',
      "lib/images/balde asinha.jpg",
      '10 pedaços | 300g', // Resumo
    ));
    lista.add(Prato(
      "Refrigerante",
      "Refrigerante gelado para acompanhar seu prato",
      'R\$ 5,00',
      "lib/images/balde asinha.jpg",
      '350ml', // Resumo
    ));
    lista.add(Prato(
      "Água c/gás",
      "Água mineral com gás, refrescante",
      'R\$ 3,00',
      "lib/images/balde asinha.jpg",
      '500ml', // Resumo
    ));
    lista.add(Prato(
      "Água s/gás",
      "Água mineral natural, perfeita para hidratação",
      'R\$ 2,50',
      "lib/images/balde asinha.jpg",
      '500ml', // Resumo
    ));
    lista.add(Prato(
      "Suco Dell Valle",
      "Suco natural de frutas, refrescante e saudável",
      'R\$ 5,50',
      "lib/images/balde asinha.jpg",
      '350ml', // Resumo
    ));
    return lista;
  }
}