import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/login/data/datasource/login_datasource_impl.dart';
import 'package:to_do_app/app/modules/login/domain/errors/login_errors.dart';

class LoginRepository {
  final datasource = Modular.get<LoginDatasourceImpl>();

  Future<Either<LoginErrors, User>> login(String email, String password) async {
    try {
      var userCredential = await datasource.login(email, password);
      return Right(userCredential.user!);
    } on LoginErrors catch (e) {
      return Left(e);
    }
  }
}
