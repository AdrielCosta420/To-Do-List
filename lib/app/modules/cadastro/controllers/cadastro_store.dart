import 'package:mobx/mobx.dart';

class CadastroStore {
  final passwordVisible = Observable<bool>(true);

  void passwordVisibleChange() =>
      runInAction(() => passwordVisible.value = !passwordVisible.value);

  final confirmPasswordVisible = Observable<bool>(true);

  void confirmPasswordVisibleChange() => runInAction(
      () => confirmPasswordVisible.value = !confirmPasswordVisible.value);

  final isLoadingCad = Observable(true);

  void isLoadingCadChange(bool value) =>
      runInAction(() => isLoadingCad.value = value);
}
