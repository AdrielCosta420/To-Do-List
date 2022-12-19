// ignore_for_file: public_member_api_docs, sort_constructors_first
class TasksErrors implements Exception {
  String message;
  String? messageError;
  StackTrace? stackTrace;
  String? codeError;
  TasksErrors({
    required this.message,
    this.messageError,
    this.stackTrace,
    this.codeError,
  });
}
