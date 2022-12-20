import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/tasks/domain/entities/task.dart';
import 'package:to_do_app/app/modules/tasks/domain/errors/tasks_errors.dart';
import 'package:to_do_app/app/modules/tasks/domain/repositories/tasks_repository.dart';
import 'package:asuka/asuka.dart' as asuka;

abstract class UpdateTaskUc {
  Future<void> call(Tasks tasks);
}

class UpdateTaskUcImpl implements UpdateTaskUc {
  final TasksRepository repository = Modular.get();
  @override
  Future<void> call(Tasks tasks) async {
    try {
      await repository.updateTask(tasks);
    } on TasksErrors catch (e) {
      asuka.AsukaSnackbar.alert(e.message);
    }
  }
}
