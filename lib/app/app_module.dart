import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/cadastro/cadastro_module.dart';

import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
    
  ];
}
