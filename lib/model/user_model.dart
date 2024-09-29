class Usuario{
  //Atributos
  final String nome;
  final String email;
  final String senha;

  //Construtor
  Usuario (
    this.nome,
    this.email,
    this.senha,
  );

  //
  //Método para geração de Contatos
  //
  static List<Usuario> listaUsuarios = [];

    static void adicionarUser(String nome, String email, String senha) {
      listaUsuarios.add(Usuario(nome, email, senha));
    }

    static List<Usuario> obterUsuarios() {
      return listaUsuarios;
    }

}