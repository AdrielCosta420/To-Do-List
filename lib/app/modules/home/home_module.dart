import 'package:to_do_app/app/modules/home/data/datasource/home_datasource_datasource_impl.dart';
import 'package:to_do_app/app/modules/home/home_page.dart';
import 'package:to_do_app/app/modules/home/controllers/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/home/ui/task_page.dart';
import 'package:to_do_app/app/modules/tasks/tasks_module.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [TasksModule()];


  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => HomeDatasourceDatasourceImpl()),

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const TaskPage()),
  ];
}
