import 'package:firebase_auth/firebase_auth.dart';

abstract class CadastroDatasource {
  Future<UserCredential> cadastro(String email, String senha);
}
