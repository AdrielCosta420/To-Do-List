// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginErrors implements Exception {
  final String messageError;
  final StackTrace? stackTrace;
  final String? error;

  LoginErrors({
    required this.messageError,
    this.stackTrace,
    this.error,
  });
}
