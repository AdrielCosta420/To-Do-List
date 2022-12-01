import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/cadastro/cadastro_module.dart';
import 'package:to_do_app/app/modules/login/ui/login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginPage()),
        ModuleRoute('/cadastro', module: CadastroModule()),
      ];
}
