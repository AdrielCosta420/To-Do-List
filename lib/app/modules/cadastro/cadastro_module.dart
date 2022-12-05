import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/cadastro/controllers/cadastro_store.dart';
import 'package:to_do_app/app/modules/cadastro/data/datasource/cadastro_datasource.dart';
import 'package:to_do_app/app/modules/cadastro/data/datasource/cadastro_datasource_impl.dart';
import 'package:to_do_app/app/modules/cadastro/infra/repositories/cadastro_repository.dart';
import 'package:to_do_app/app/modules/cadastro/presenter/usecases/cadastrar_usuario_impl_uc.dart';
import 'package:to_do_app/app/modules/cadastro/presenter/usecases/cadastrar_usuario_uc.dart';
import 'package:to_do_app/app/modules/cadastro/ui/cadastro_page.dart';

class CadastroModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => CadastroStore()),
        Bind.lazySingleton<CadastroDatasource>((i) => CadastroDatasourceImpl()),
        Bind.lazySingleton((i) => CadastroRepository()),
        Bind.lazySingleton<CadastrarUsuarioUc>((i) => CadastrarUsuarioImplUc()),
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const CadastroPage())];
}
