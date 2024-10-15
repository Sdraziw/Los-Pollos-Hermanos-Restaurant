/* RF004 Detalhes do Item
● Apresentação detalhada dos itens do cardápio, incluindo imagem, nome, descrição completa e preço
● Adicionar item ao pedido.
*/

class Prato {
  String nome;
  String preco;
  String foto;
  String descricao;
  String resumo;
  int quantidade;
  String status;

  Prato({
    required this.nome,
    required this.preco,
    required this.foto,
    required this.descricao,
    required this.resumo,
    this.quantidade = 1, // Valor padrão
    this.status = "Aguardando pagamento", // Status inicial
  });

  // Método para calcular o preço do prato em formato numérico
  double get precoNumerico {
    return double.parse(preco.replaceAll('R\$ ', '').replaceAll(',', '.'));
  }

  // Método para atualização da quantidade
  void atualizarQuantidade(int novaQuantidade) {
    if (novaQuantidade > 0) {
      quantidade = novaQuantidade;
    }
  }

  //
  // Método para geração de Entradas
  //
  static List<Prato> gerarEntradas() {
    return [
      Prato(
        nome: 'Onion Rings',
        preco: 'R\$ 10,50',
        foto: 'lib/images/onion rings.png',
        descricao: 'Anéis de cebola empanados e fritos, crocantes',
        resumo: '10 pedaços | 300g',
      ),
      Prato(
        nome: "Nuggets",
        preco: "R\$ 10,50",
        foto: "lib/images/nuggets.png",
        descricao:
            "Nuggets de frango empanados, crocantes por fora e suculentos por dentro",
        resumo: '10 pedaços | 300g',
      ),
      Prato(
        nome: "Batata Frita G",
        preco: "R\$ 10,90",
        foto: "lib/images/french fries (2).png",
        descricao: "Batatas fritas, crocantes e temperadas",
        resumo: '200g',
      ),
      Prato(
        nome: "Batata Frita M",
        preco: "R\$ 8,90",
        foto: "lib/images/french fries (2).png",
        descricao: "Batatas fritas, crocantes e temperadas",
        resumo: '150g',
      ),
      Prato(
        nome: "Batata Frita P",
        preco: "R\$ 7,90",
        foto: "lib/images/french fries (2).png",
        descricao: "Batatas fritas, crocantes e temperadas",
        resumo: '100g',
      ),
      Prato(
        nome: "Combo Onions & Fritas",
        preco: "R\$ 35,50",
        foto: "lib/images/onions_batatas.png",
        descricao:
            "Anéis de cebola & Frango e Batatas fritas crocantes e temperadas num combo com maionese, ketchup, molhos especiais e molhos separados de mostarda e mel + barbecue + cebola crua",
        resumo:
            'Sortidos 1/3 de onions + 1/3 de batatas + 1/3 de frango empanado | 1,1 kg',
      ),
    ];
  }

  //
  // Método para geração de Pratos Principais
  //
  static List<Prato> gerarPratosPrincipais() {
    return [
      Prato(
        nome: 'X - Walter White',
        preco: 'R\$ 25,50',
        foto: 'lib/images/burguer.png',
        descricao: 'Peito de frango empanado com queijo, tiras de bacon e molho especial',
        resumo: '400g',
      ),
      Prato(
        nome: "X - Heisenberg",
        preco: "R\$ 45,50",
        foto: "lib/images/hamburger.png",
        descricao: "Dois hamburgueres com muito cheddar, tiras de bacon e molho picante",
        resumo: '500g',
      ),
      Prato(
        nome: "X - Hank Schrader",
        preco: "R\$ 32,50",
        foto: "lib/images/hankburger.png",
        descricao: "Hamburguer saboroso de gnu, uma fatia semi-derretida de cheddar, anéis de cebola, fatias de picles, salada refrescante de alface e tomate, maionese e molho especial",
        resumo: '500g',
      ),
      Prato(
        nome: "X - Gus Fring",
        preco: "R\$ 25,50",
        foto: "lib/images/xsalada.png",
        descricao: "Hamburguer suculento dos pampas, uma fatia de muçarela e uma salada refrescante de alface e tomate",
        resumo: '500g',
      ),
      Prato(
        nome: "X - Jesse Pinkman",
        preco: "R\$ 15,50",
        foto: "lib/images/jesseburger.png",
        descricao: "Hamburguer delicioso feito na chapa, uma fatia generosa de cheddar e molho especial",
        resumo: '500g',
      ),
      Prato(
        nome: "Combo Duplo - Cê é LOCO cachoeira",
        preco: "R\$ 55,90",
        foto: "lib/images/slc que foto.jpeg",
        descricao:
            "2 Pães de hamburguer, 2 X Frango Parrudo Empanado, Molho Barbecue",
        resumo: '2 lanches parrudo | 200g cada',
      ),
    ];
  }

  static List<Prato> gerarBaldes() {
    return [
      Prato(
        nome: 'Balde de Frango G',
        preco: 'R\$ 19,50',
        foto: 'lib/images/balde G.png',
        descricao: 'Frango marinado em especiarias, frito até a perfeição',
        resumo: '14 pedaços | 600g',
      ),
      Prato(
        nome: 'Balde de Frango M',
        preco: 'R\$ 17,50',
        foto: 'lib/images/balde G.png',
        descricao: 'Frango marinado em especiarias, frito até a perfeição',
        resumo: '12 pedaços | 500g',
      ),
      Prato(
        nome: 'Balde de Frango P',
        preco: 'R\$ 15,50',
        foto: 'lib/images/balde G.png',
        descricao: 'Frango marinado em especiarias, frito até a perfeição',
        resumo: '10 pedaços | 400g',
      ),
    ];
  }

  //
  // Método para geração de Bebidas
  //
  static List<Prato> gerarBebidas() {
    return [
      Prato(
        nome: "Refrigerante Soda",
        preco: "R\$ 10,90",
        foto: "lib/images/refri G.png",
        descricao: "Refrigerante Soda 500ml gelado para acompanhar seu prato",
        resumo: '500ml',
      ),
      Prato(
        nome: "Refrigerante Coca",
        preco: "R\$ 12,90",
        foto: "lib/images/coke.png",
        descricao: "Refrigerante Coca 500ml gelado para acompanhar seu prato",
        resumo: '500ml',
      ),
      Prato(
        nome: "Refrigerante Schweppes",
        preco: "R\$ 9,50",
        foto: "lib/images/Schweppes.png",
        descricao:
            "Refrigerante Schweppes 1500ml gelado para acompanhar seu pedido",
        resumo: 'Um litro e meio.',
      ),
      Prato(
        nome: "Água c/gás",
        preco: "R\$ 3,00",
        foto: "lib/images/agua-com-gas-500ml.png",
        descricao: "Água mineral com gás, refrescante",
        resumo: '500ml',
      ),
      Prato(
        nome: "Água s/gás",
        preco: "R\$ 2,50",
        foto: "lib/images/agua_sem_gas.png",
        descricao: "Água mineral natural, perfeita para hidratação",
        resumo: '500ml',
      ),
      Prato(
        nome: "Suco Dell Valle",
        preco: "R\$ 7,50",
        foto: "lib/images/suco_delvale.png",
        descricao: "Suco natural de frutas, refrescante e saudável",
        resumo: '350ml',
      ),
    ];
  }

  //
  // Método para geração de Sobremesas
  //
  static List<Prato> gerarSobremesas() {
    return [
      Prato(
        nome: "Cheesecake",
        preco: "R\$ 12,00",
        foto: "lib/images/cheesecake.jpg",
        descricao: "Delicioso cheesecake com cobertura de frutas vermelhas",
        resumo: '1 fatia',
      ),
      Prato(
        nome: "Brownie",
        preco: "R\$ 8,00",
        foto: "lib/images/brownie.jpg",
        descricao: "Brownie de chocolate com nozes",
        resumo: '1 pedaço',
      ),
      Prato(
        nome: "Sorvete Negresco",
        preco: "R\$ 7,50",
        foto: "lib/images/ice-cream.webp",
        descricao:
            "Sorvete Negresco é feito de leite condensado, leite, biscoitos Negresco, essência de baunilha, ovos, açúcar e creme de leite. Bem simples e delicioso! 🍦",
        resumo: 'Casquinha Recheada e Massa Baunilha',
      ),
    ];
  }
}
