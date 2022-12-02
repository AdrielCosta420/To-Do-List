import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/login/domain/entities/login.dart';
import 'package:to_do_app/app/modules/login/infra/repository/login_repository.dart';
import 'package:to_do_app/app/modules/login/presenter/controllers/login_store.dart';
import 'package:to_do_app/app/modules/login/presenter/usecases/logar_usuario_uc.dart';

class LogarUsuarioUcImpl implements LogarUsuarioUc {
  final repository = Modular.get<LoginRepository>();
  final store = Modular.get<LoginStore>();

  @override
  call(Login login, BuildContext context) async {
    store.isLoadingChange();
    var response = await repository.login(login.email, login.senha);

    response.fold((l) {
      Flushbar(
        backgroundColor: Colors.red,
        title: 'ERRO',
        titleColor: Colors.white,
        message: l.messageError,
        messageColor: Colors.white,
        duration: const Duration(milliseconds: 3),
      ).show(context);
    }, (r) {
      Modular.to.pushNamedAndRemoveUntil('/home/', (p0) => false);
    });

    store.isLoadingChange();
  }
}
