import 'package:mobx/mobx.dart';

class TasksStore {
  final _valuePriority = Observable<String?>(null);

  String? get valuePriority => _valuePriority.value ;

  String valuePriorityChange(String? value) =>
      runInAction(() => _valuePriority.value = value ?? '0');
}
