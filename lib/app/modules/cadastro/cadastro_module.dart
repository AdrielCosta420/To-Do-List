import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/cadastro/ui/cadastro_page.dart';

class CadastroModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => CadastroPage(),)
  ];
}
