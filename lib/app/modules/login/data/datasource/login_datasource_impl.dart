import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/app/modules/login/domain/errors/login_errors.dart';

import 'login_datasource.dart';

class LoginDatasourceImpl implements LoginDatasource {
  @override
  Future<UserCredential> login(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      var userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        return userCredential;
      } else {
        throw LoginErrors(messageError: 'Usuário ou Senha incorreto');
      }
    } on FirebaseAuthException catch (e) {
      throw LoginErrors(
          messageError: 'Usuário ou Senha incorreto',
          error: e.message,
          stackTrace: e.stackTrace);
    }
  }
}
