
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/esqueceu%20senha/data/datasource/esqueceu_senha_datasource.dart';
import 'package:to_do_app/app/modules/esqueceu%20senha/data/datasource/esqueceu_senha_datasource_impl.dart';
import 'package:to_do_app/app/modules/esqueceu%20senha/ui/esqueceu_senha_page.dart';

class EsqueceuSenhaModule extends Module{
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<EsqueceuSenhaDatasource>((i) => EsqueceuSenhaDatasourceImpl()),
        
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) =>  EsqueceuSenhaPage()),
      ];
}