import 'package:mobx/mobx.dart';

class LoginStore {
  final mostraSenha = Observable<bool>(true);

  void mostraSenhaChange() =>
      runInAction(() => mostraSenha.value = !mostraSenha.value);

  final _isLoading = Observable<bool>(false);

  bool get isLoading => _isLoading.value;
  void isLoadingChange() =>
      runInAction(() => _isLoading.value = !_isLoading.value);
}
