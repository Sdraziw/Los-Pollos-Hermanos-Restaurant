class Usuario {
  String nome;
  String email;
  String senha;

  Usuario({required this.nome, required this.email, required this.senha});

  // Lista estática de usuários cadastrados
  static List<Usuario> usuarios = [];

  static void zeraLista(){
    usuarios.clear();
  }

  // Função para adicionar um novo usuário
  static void adicionarUser(String nome, String email, String senha) {
    // Verifica se o email já está cadastrado
    if (usuarios.any((usuario) => usuario.email == email)) {
      throw Exception('E-mail já cadastrado');
    }
    usuarios.add(Usuario(nome: nome, email: email, senha: senha));
  }

  // Função para verificar se o login é válido
  static Usuario? login(String email, String senha) {
    for (var usuario in usuarios) {
      if (usuario.email == email && usuario.senha == senha) {
        return usuario;
      }
    }
    return null;
  }
}