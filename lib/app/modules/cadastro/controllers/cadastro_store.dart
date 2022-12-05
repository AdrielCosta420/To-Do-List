import 'package:mobx/mobx.dart';

class CadastroStore {
  final passwordVisible = Observable<bool>(true);

  void passwordVisibleChange() =>
      runInAction(() => passwordVisible.value = !passwordVisible.value);

  final confirmPasswordVisible = Observable<bool>(true);

  void confirmPasswordVisibleChange() => runInAction(
      () => confirmPasswordVisible.value = !confirmPasswordVisible.value);

  final _isLoadingCad = Observable(false);

  bool get isLoadingCad => _isLoadingCad.value;

  void isLoadingCadChange() =>
      runInAction(() => _isLoadingCad.value = !_isLoadingCad.value);
}
