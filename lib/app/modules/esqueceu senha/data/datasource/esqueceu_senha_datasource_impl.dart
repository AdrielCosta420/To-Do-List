import 'package:firebase_auth/firebase_auth.dart';

import 'esqueceu_senha_datasource.dart';

class EsqueceuSenhaDatasourceImpl implements EsqueceuSenhaDatasource {
  @override
  Future<void> esqueceuSenha(String email) async {
   FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
