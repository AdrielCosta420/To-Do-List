// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cadastro {
  final String email;
  final String senha;
  final String nome;
  final DateTime? dataNascimento;

  Cadastro({
    required this.email,
    required this.senha,
    required this.nome,
    this.dataNascimento,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'senha': senha,
      'nome': nome,
      'dataNascimento': dataNascimento?.millisecondsSinceEpoch,
    };
  }

  factory Cadastro.fromMap(Map<String, dynamic> map) {
    return Cadastro(
      email: map['email'] as String,
      senha: map['senha'] as String,
      nome: map['nome'] as String,
      dataNascimento: map['dataNascimento'] != null ? DateTime.fromMillisecondsSinceEpoch(map['dataNascimento'] as int) : null,
    );
  }
}
