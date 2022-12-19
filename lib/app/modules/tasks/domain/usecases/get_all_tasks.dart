import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/tasks/domain/entities/task.dart';
import 'package:to_do_app/app/modules/tasks/domain/repositories/tasks_repository.dart';

abstract class GetAllTasks {
  Stream<List<Tasks>> call();
}

class GetAllTasksImpl implements GetAllTasks {
  final TasksRepository repository = Modular.get();
  @override
  Stream<List<Tasks>> call() {
    return repository.getAllTasks();
  }
}
