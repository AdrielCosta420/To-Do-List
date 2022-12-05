import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/app/modules/login/data/datasource/login_datasource.dart';
import 'package:to_do_app/app/modules/login/domain/errors/login_errors.dart';

class LoginDatasourceImpl implements LoginDatasource {
  @override
  Future<UserCredential> login(String email, String password) async {
    try {
      return FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw LoginErrors(
          messageError: "Erro ao fazer login",
          stackTrace: e.stackTrace,
          error: e.message);
    } on Exception catch (_) {
      throw LoginErrors(messageError: "Erro desconhecido ao fazer login");
    }
  }
}
