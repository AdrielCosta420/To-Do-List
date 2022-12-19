import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/app/modules/tasks/domain/entities/task.dart';

abstract class TasksDatasource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllTasks();
  Future<void> deleteTask(String id);
  Future<String> saveTask(Tasks task);
  Future<void> updateTask(Tasks tasks);
}
