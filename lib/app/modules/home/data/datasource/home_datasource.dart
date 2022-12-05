import 'package:firebase_auth/firebase_auth.dart';

abstract class HomeDatasource {
  Future<void> logout();
}
