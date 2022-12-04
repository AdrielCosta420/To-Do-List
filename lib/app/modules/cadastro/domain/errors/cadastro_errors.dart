class CadastroErrors implements Exception {
  final String messangeError;
  final StackTrace? stackTrace;
  final String? error;

  CadastroErrors({
    required this.messangeError,
    this.stackTrace,
    this.error,
  });
}
