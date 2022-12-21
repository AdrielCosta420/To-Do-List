import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/app/modules/login/domain/entities/usuario.dart';

abstract class CadastroDatasource {
  Future<UserCredential> cadastroEmailSenha(String email, String senha);
  Future<Usuario> saveUsuario(Usuario usuario, String uuid);
}
