import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/tasks/domain/entities/task.dart';
import 'package:to_do_app/app/modules/tasks/domain/errors/tasks_errors.dart';
import 'package:to_do_app/app/modules/tasks/domain/repositories/tasks_repository.dart';
import 'package:to_do_app/app/modules/tasks/infra/datasources/tasks_datasource.dart';


class TasksRepositoryImpl implements TasksRepository {
  final TasksDatasource datasource = Modular.get();

  @override
  Future<void> deleteTask(String id) async {
    try {
      await datasource.deleteTask(id);
    } on TasksErrors catch (_) {
      rethrow;
    }
  }

  @override
  Stream<List<Tasks>> getAllTasks() {
    try {
      var tasksMaps = datasource.getAllTasks();
      return tasksMaps.map(
          (event) => event.docs.map((e) => Tasks.fromMap(e.data())).toList());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> saveTask(Tasks task) async {
    try {
      return await datasource.saveTask(task);
    } on TasksErrors catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> updateTask(Tasks tasks) async {
    try {
      await datasource.updateTask(tasks);
    } on TasksErrors catch (_) {
      rethrow;
    }
  }
}
