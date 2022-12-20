import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/app/modules/tasks/domain/entities/task.dart';
import 'package:to_do_app/app/modules/tasks/domain/errors/tasks_errors.dart';
import 'package:to_do_app/app/modules/tasks/infra/datasources/tasks_datasource.dart';
import 'package:to_do_app/common/constants/firebase_colections.dart';

class TasksDatasourceImpl implements TasksDatasource {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<void> deleteTask(String id) async {
    try {
      if (auth.currentUser != null) {
        await firebaseFirestore
            .collection(usuariosCollection)
            .doc(auth.currentUser?.uid)
            .collection(taskCollection)
            .doc(id)
            .delete();
      } else {
        throw TasksErrors(message: "Usuario não logado");
      }
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
      if (auth.currentUser != null) {
        return firebaseFirestore
            .collection(usuariosCollection)
            .doc(auth.currentUser?.uid)
            .collection(taskCollection)
            .snapshots();
      } else {
        throw TasksErrors(message: "Usuario não logado");
      }
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
      if (auth.currentUser != null) {
        return await firebaseFirestore
            .collection(usuariosCollection)
            .doc(auth.currentUser?.uid)
            .collection(taskCollection)
            .add(task.toMap())
            .then((value) => value.id);
      } else {
        throw TasksErrors(message: "Usuario não logado");
      }
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
      if (auth.currentUser != null) {
        return await firebaseFirestore
            .collection(usuariosCollection)
            .doc(auth.currentUser?.uid)
            .collection(taskCollection)
            .doc(tasks.uuid)
            .update(tasks.toMap());
      } else {
        throw TasksErrors(message: "Usuario não logado");
      }
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
