import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../data/datasource/login_datasource_impl.dart';
import '../../domain/errors/login_errors.dart';

class LoginRepository {
  final datasource = Modular.get<LoginDatasourceImpl>();

  Future<User> login(String email, String password) async {
    try {
      var userCredential = await datasource.login(email, password);
      if (userCredential.user != null) {
        return userCredential.user!;
      } else {
        throw LoginErrors(messageError: 'Erro ao fazer login');
      }
    } on LoginErrors catch (e) {
      rethrow;
    } on Exception catch (_) {
      throw LoginErrors(messageError: "Erro ao fazer Login");
    }
  }
}
