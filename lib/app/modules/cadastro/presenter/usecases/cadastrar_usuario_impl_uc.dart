import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/cadastro/controllers/cadastro_store.dart';
import 'package:to_do_app/app/modules/cadastro/domain/cadastro.dart';
import 'package:to_do_app/app/modules/cadastro/infra/repositories/cadastro_repository.dart';
import 'package:to_do_app/app/modules/cadastro/presenter/usecases/cadastrar_usuario_uc.dart';

class CadastrarUsuarioImplUc implements CadastrarUsuarioUc {
  final store = Modular.get<CadastroStore>();
  final repository = Modular.get<CadastroRepository>();

  @override
  call(Cadastro cadastro, BuildContext buildContext) async {
    store.isLoadingCadChange();
    var response = await repository.cadastro(cadastro.email, cadastro.senha, cadastro.nome, cadastro.dataNascimento?? DateTime.now() );

    response.fold((l) {
      Flushbar(
        backgroundColor: Colors.red,
        title: 'ERRO',
        titleColor: Colors.white,
        message: l.messangeError,
        messageColor: Colors.white,
        duration: const Duration(milliseconds: 3),
      );
    }, (r) {
      Modular.to.pushNamedAndRemoveUntil('/home/', (p0) => false,);
    });
    store.isLoadingCadChange();
  }
}
