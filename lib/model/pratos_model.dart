class Prato{
  //Atributos
  final String nome;
  final String descricao;
  final String preco;
  final String foto;

  //Construtor
  Prato (
    this.nome,
    this.descricao,
    this.preco,
    this.foto,
  );

  //
  //Método para geração de Contatos
  //
  static List<Prato> gerarDados(){
    List<Prato> lista = [];
    lista.add(Prato('Balde de Frango G', '14 pedaços', 'R\$15.5', 
        'lib/images/balde asinha.jpg'));
    lista.add(Prato("Balde de Frango M", "12 pedaços", 'R\$13.5',
        "lib/images/balde asinha.jpg"));
    lista.add(Prato("Balde de Frango P", "10 pedaços", 'R\$10.5',
        "lib/images/balde asinha.jpg"));
        lista.add(Prato('X - White', '14 pedaços', 'R\$15.5', 
        'lib/images/balde asinha.jpg'));
    lista.add(Prato("X - Heiseinberg", "12 pedaços", 'R\$13.5',
        "lib/images/balde asinha.jpg"));
    lista.add(Prato("X - Jesse", "10 pedaços", 'R\$10.5',
        "lib/images/balde asinha.jpg"));
        lista.add(Prato('X - Gus', '14 pedaços', 'R\$15.5', 
        'lib/images/balde asinha.jpg'));
    lista.add(Prato("X - I'm the Danger", "12 pedaços", 'R\$13.5',
        "lib/images/balde asinha.jpg"));
    lista.add(Prato("X - WW", "10 pedaços", 'R\$10.5',
        "lib/images/balde asinha.jpg"));
        lista.add(Prato('X - Hank', '14 pedaços', 'R\$15.5', 
        'lib/images/balde asinha.jpg'));
    lista.add(Prato("X - Better Call Saul", "12 pedaços", 'R\$13.5',
        "lib/images/balde asinha.jpg"));
    lista.add(Prato("X - The Fly", "10 pedaços", 'R\$10.5',
        "lib/images/balde asinha.jpg"));
    lista.add(Prato("X - Grey Matter", "10 pedaços", 'R\$10.5',
        "lib/images/balde asinha.jpg"));
    lista.add(Prato("X - Blue Math", "10 pedaços", 'R\$10.5',
        "lib/images/balde asinha.jpg"));
    lista.add(Prato('Batata Frita G', '14 pedaços', 'R\$15.5', 
        'lib/images/balde asinha.jpg'));
    lista.add(Prato("Batata Friat M", "12 pedaços", 'R\$13.5',
        "lib/images/balde asinha.jpg"));
    lista.add(Prato("Batata Frita P", "10 pedaços", 'R\$10.5',
        "lib/images/balde asinha.jpg"));
    lista.add(Prato("Onion Rings", "10 pedaços", 'R\$10.5',
        "lib/images/balde asinha.jpg"));
    lista.add(Prato("Nuggets", "10 pedaços", 'R\$10.5',
        "lib/images/balde asinha.jpg"));
    lista.add(Prato("Refrigerante", "10 pedaços", 'R\$10.5',
        "lib/images/balde asinha.jpg"));
    lista.add(Prato("Água c/gás", "10 pedaços", 'R\$10.5',
        "lib/images/balde asinha.jpg"));
    lista.add(Prato("Água s/gás", "10 pedaços", 'R\$10.5',
        "lib/images/balde asinha.jpg"));
    lista.add(Prato("Suco Dell Valle", "10 pedaços", 'R\$10.5',
        "lib/images/balde asinha.jpg"));
    return lista;
  }

}