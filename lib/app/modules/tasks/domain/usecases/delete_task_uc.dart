import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/tasks/domain/errors/tasks_errors.dart';
import 'package:to_do_app/app/modules/tasks/domain/repositories/tasks_repository.dart';
import 'package:asuka/asuka.dart' as asuka;

abstract class DeleteTaskUc {
  Future<void> call(String id);
}

class DeleteTaskUcImpl implements DeleteTaskUc {
  @override
  Future<void> call(String id) async {
    final TasksRepository repository = Modular.get();
    try {
      await repository.deleteTask(id);
    } on TasksErrors catch (e) {
      asuka.AsukaSnackbar.alert(e.message);
    }
  }
}
