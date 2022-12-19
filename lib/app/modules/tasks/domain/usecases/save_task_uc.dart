import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/tasks/domain/entities/task.dart';
import 'package:to_do_app/app/modules/tasks/domain/repositories/tasks_repository.dart';

abstract class SaveTaskUc {
  Future<void> call(Tasks tasks);
}

class SaveTaskUcImpl implements SaveTaskUc {
  final TasksRepository repository = Modular.get();
  @override
  call(Tasks tasks) async {
    var uuid = await repository.saveTask(tasks);
    var updateTask = tasks.copyWith(uuid: uuid);
    await repository.updateTask(updateTask);
  }
}
