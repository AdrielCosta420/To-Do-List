import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/cadastro/controllers/cadastro_store.dart';
import 'package:to_do_app/app/modules/cadastro/data/datasource/cadastro_datasource.dart';
import 'package:to_do_app/app/modules/cadastro/domain/errors/cadastro_errors.dart';
import 'package:to_do_app/app/modules/login/domain/entities/usuario.dart';
import 'package:to_do_app/common/constants/firebase_colections.dart';

class CadastroDatasourceImpl implements CadastroDatasource {
  final CadastroStore store = Modular.get();
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  @override
  Future<UserCredential> cadastroEmailSenha(String email, String senha) async {
    store.isLoadingCadChange();
    try {
      return auth.createUserWithEmailAndPassword(email: email, password: senha);
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

  @override
  Future<Usuario> saveUsuario(Usuario usuario, String uuid) async {
    try {
      await firestore
          .collection(usuariosCollection)
          .doc(uuid)
          .set(usuario.toMap());
      var documentSnapshot =
          await firestore.collection(usuariosCollection).doc(uuid).get();
      if(documentSnapshot.data() != null){
        return Usuario.fromMap(documentSnapshot.data()?? {});
      }else{
        throw CadastroErrors(
          messangeError: 'Erro ao buscar usuario no cadastro');
      }
    } catch (e) {
      throw CadastroErrors(
          messangeError: 'Erro ao salvar usuario');
    }
  }
}
