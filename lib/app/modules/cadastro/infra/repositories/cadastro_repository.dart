import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/cadastro/data/datasource/cadastro_datasource_impl.dart';
import 'package:to_do_app/app/modules/cadastro/domain/errors/cadastro_errors.dart';
class CadastroRepository {
  final datasource = Modular.get<CadastroDatasourceImpl>();

  Future<Either<CadastroErrors, User>> cadastro(
      String email, String senha) async {
    try {
      var userCredential = await datasource.cadastro(email, senha);
      return Right(userCredential.user!);
    } on CadastroErrors catch (e) {
      return Left(e);
    }
  }
}
