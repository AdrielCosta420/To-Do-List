import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/cadastro/controllers/cadastro_store.dart';
import 'package:to_do_app/app/modules/cadastro/ui/cadastro_page.dart';

class CadastroModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton((i) => CadastroStore()),
    ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const CadastroPage())];
}
