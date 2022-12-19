import '../entities/task.dart';

abstract class TasksRepository {
  Stream<List<Tasks>> getAllTasks();
  Future<void> deleteTask(String id);
  Future<String> saveTask(Tasks task);
  Future<void> updateTask(Tasks tasks);
}