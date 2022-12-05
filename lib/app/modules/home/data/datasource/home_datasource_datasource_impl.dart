import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/app/modules/home/data/datasource/home_datasource.dart';

class HomeDatasourceDatasourceImpl implements HomeDatasource {
  
  @override
  Future<void> logout() async{
      await FirebaseAuth.instance.signOut();
  }
}
