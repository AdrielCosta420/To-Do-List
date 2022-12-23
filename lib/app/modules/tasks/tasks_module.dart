
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/tasks/data/datasource/tasks_datasource_impl.dart';
import 'package:to_do_app/app/modules/tasks/domain/repositories/tasks_repository.dart';
import 'package:to_do_app/app/modules/tasks/domain/usecases/delete_task_uc.dart';
import 'package:to_do_app/app/modules/tasks/domain/usecases/get_all_tasks.dart';
import 'package:to_do_app/app/modules/tasks/domain/usecases/save_task_uc.dart';
import 'package:to_do_app/app/modules/tasks/domain/usecases/update_task_uc.dart';
import 'package:to_do_app/app/modules/tasks/infra/datasources/tasks_datasource.dart';
import 'package:to_do_app/app/modules/tasks/infra/repository/tasks_repository_impl.dart';
import 'package:to_do_app/app/modules/tasks/presenter/controllers/tasks_store.dart';

class TasksModule extends Module{
   @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton<TasksDatasource>((i) => TasksDatasourceImpl(),export: true),
    Bind.lazySingleton<TasksRepository>((i) => TasksRepositoryImpl(),export: true),
    Bind.lazySingleton<DeleteTaskUc>((i) => DeleteTaskUcImpl(),export: true),
    Bind.lazySingleton<GetAllTasks>((i) => GetAllTasksImpl(),export: true),
    Bind.lazySingleton<SaveTaskUc>((i) => SaveTaskUcImpl(),export: true),
    Bind.lazySingleton<UpdateTaskUc>((i) => UpdateTaskUcImpl(),export: true),
    Bind.lazySingleton((i) => TasksStore(), export: true),
  ];
  
}