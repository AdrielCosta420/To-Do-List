import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/cadastro/controllers/cadastro_store.dart';
import 'package:to_do_app/app/modules/cadastro/data/datasource/cadastro_datasource.dart';
import 'package:to_do_app/app/modules/cadastro/domain/errors/cadastro_errors.dart';

class CadastroDatasourceImpl implements CadastroDatasource {
  final CadastroStore store = Modular.get();
  
  @override
  Future<UserCredential> cadastro(String email, String senha) async {
    store.isLoadingCadChange(true);
    try {
      return FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: senha);
    } on FirebaseAuthException catch (e) {
      throw CadastroErrors(
        messangeError: 'Erro ao fazer cadastro',
        error: e.code,
        stackTrace: e.stackTrace,
      );
    } on Exception catch (_) {
      throw CadastroErrors(
          messangeError: 'Erro desconhecido ao fazer cadastro');
    }

  }


  

}
