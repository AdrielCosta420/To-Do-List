import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/app/modules/tasks/domain/entities/task.dart';
import 'package:to_do_app/app/modules/tasks/domain/errors/tasks_errors.dart';
import 'package:to_do_app/app/modules/tasks/infra/datasources/tasks_datasource.dart';
import 'package:to_do_app/common/constants/firebase_colections.dart';

class TasksDatasourceImpl implements TasksDatasource {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> deleteTask(String id) async {
    try {
      await firebaseFirestore.collection(taskCollection).doc(id).delete();
    } on FirebaseException catch (e) {
      throw TasksErrors(
        message: "Error ao Deletar Tarefa",
        codeError: e.code,
        messageError: e.message,
        stackTrace: e.stackTrace,
      );
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllTasks() {
    try {
      return firebaseFirestore.collection(taskCollection).snapshots();
    } on FirebaseException catch (e) {
      throw TasksErrors(
        message: "Error ao Buscar todas as Tarefa",
        codeError: e.code,
        messageError: e.message,
        stackTrace: e.stackTrace,
      );
    }
  }

  @override
  Future<String> saveTask(Tasks task) async {
    try {
      return await firebaseFirestore
          .collection(taskCollection)
          .add(task.toMap())
          .then((value) => value.id);
    } on FirebaseException catch (e) {
      throw TasksErrors(
        message: "Error ao salvar Tarefa",
        codeError: e.code,
        messageError: e.message,
        stackTrace: e.stackTrace,
      );
    }
  }

  @override
  Future<void> updateTask(Tasks tasks) async {
    try {
      return await firebaseFirestore
          .collection(taskCollection)
          .doc(tasks.uuid)
          .update(tasks.toMap());
    } on FirebaseException catch (e) {
      throw TasksErrors(
        message: "Error ao salvar Tarefa",
        codeError: e.code,
        messageError: e.message,
        stackTrace: e.stackTrace,
      );
    }
  }
}
