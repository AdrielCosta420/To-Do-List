import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/cadastro/data/datasource/cadastro_datasource_impl.dart';
import 'package:to_do_app/app/modules/cadastro/domain/errors/cadastro_errors.dart';
import 'package:to_do_app/app/modules/login/domain/entities/usuario.dart';

class CadastroRepository {
  final datasource = Modular.get<CadastroDatasourceImpl>();

  Future<Either<CadastroErrors, Usuario>> cadastro(
      String email, String senha, String nome, DateTime dataNascimento) async {
    try {
      var userCredential = await datasource.cadastroEmailSenha(email, senha);
      if (userCredential.user != null) {
        final uuid = userCredential.user!.uid;
        final usuario =
            Usuario(nome: nome, dataNascimento: dataNascimento, email: email);
        var user = await datasource.saveUsuario(usuario, uuid);
        return Right(user);
      } else {
        return Left(
            CadastroErrors(messangeError: 'Erro ao cadastrar Email e senha'));
      }
    } on CadastroErrors catch (e) {
      return Left(e);
    }
  }
}
