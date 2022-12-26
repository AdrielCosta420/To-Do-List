import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/app/modules/home/data/datasource/home_datasource.dart';

class HomeDatasourceDatasourceImpl implements HomeDatasource {
  @override
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on Exception catch (e) {
      throw 'Erro ao fazer logout';
    }
  }
}
