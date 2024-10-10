class Usuario {
  String nome;
  String email;
  String senha;

  Usuario({required this.nome, required this.email, required this.senha});

  // Lista estática de usuários cadastrados
  static List<Usuario> usuarios = [];

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

  // Método para converter usuário para Map
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }

  // Método para criar um usuário a partir de um Map
  static Usuario fromMap(Map<String, dynamic> map) {
    return Usuario(
      nome: map['nome'],
      email: map['email'],
      senha: map['senha'],
    );
  }

  // Função para retornar um usuário específico pelo e-mail
  static Usuario? buscarUsuarioPorEmail(String email) {
    try {
      return usuarios.firstWhere((usuario) => usuario.email == email);
    } catch (e) {
      // Retorna null se não encontrar o usuário
      return null;
    }
  }
}