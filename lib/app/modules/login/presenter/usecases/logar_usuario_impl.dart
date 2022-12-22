import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/login/domain/errors/login_errors.dart';
import '../../domain/entities/login.dart';
import '../../infra/repository/login_repository.dart';
import '../controllers/login_store.dart';
import 'logar_usuario_uc.dart';

class LogarUsuarioUcImpl implements LogarUsuarioUc {
  final repository = Modular.get<LoginRepository>();
  final store = Modular.get<LoginStore>();

  @override
  call(Login login) async {
    store.isLoadingChange();
    try {
      var response = await repository.login(login.email, login.senha);
      if (response.uid.isNotEmpty) {
        Modular.to.pushNamedAndRemoveUntil('/home/', (p0) => false);
      }
    } on LoginErrors catch (e) {
      rethrow;
    }
    store.isLoadingChange();
  }
}
