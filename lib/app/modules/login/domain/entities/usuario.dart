
class Usuario {
  final String nome;
  final DateTime dataNascimento;
  final String email;
  final String? senha;

  Usuario({
    required this.nome,
    required this.dataNascimento,
    required this.email,
     this.senha,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'dataNascimento': dataNascimento.millisecondsSinceEpoch,
      'email': email,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      nome: map['nome'] as String,
      dataNascimento: DateTime.fromMillisecondsSinceEpoch(map['dataNascimento'] as int),
      email: map['email'] as String,
    );
  }

}
