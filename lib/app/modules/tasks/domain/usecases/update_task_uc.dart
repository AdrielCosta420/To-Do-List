import 'package:to_do_app/app/modules/tasks/domain/entities/task.dart';

abstract class UpdateTaskUc {
  Future<void> call(Tasks tasks);
}


class UpdateTaskUcImpl implements UpdateTaskUc {
  @override
  Future<void> call(Tasks tasks) {
    // TODO: implement call
    throw UnimplementedError();
  }
  
}
