import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/login/data/datasource/login_datasource.dart';
import 'package:to_do_app/app/modules/login/data/datasource/login_datasource_impl.dart';
import 'package:to_do_app/app/modules/login/infra/repository/login_repository.dart';
import 'package:to_do_app/app/modules/login/presenter/controllers/login_store.dart';
import 'package:to_do_app/app/modules/login/presenter/usecases/logar_usuario_impl.dart';
import 'package:to_do_app/app/modules/login/presenter/usecases/logar_usuario_uc.dart';
import 'package:to_do_app/app/modules/login/ui/login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => LoginStore()),
        Bind.lazySingleton<LoginDatasource>((i) => LoginDatasourceImpl()),
        Bind.lazySingleton((i) => LoginRepository()),
        Bind.lazySingleton<LogarUsuarioUc>((i) => LogarUsuarioUcImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginPage()),
        
      ];
}
