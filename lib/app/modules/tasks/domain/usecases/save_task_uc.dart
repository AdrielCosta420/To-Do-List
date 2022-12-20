import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/tasks/domain/entities/task.dart';
import 'package:to_do_app/app/modules/tasks/domain/repositories/tasks_repository.dart';

abstract class SaveTaskUc {
  Future<void> call(
      {required String task,
      String? description,
      required DateTime dataSelecionada,
      String? horaInicial,
      String? horaFinal});
}

class SaveTaskUcImpl implements SaveTaskUc {
  final TasksRepository repository = Modular.get();
  @override
  Future<void> call(
      {required String task,
      String? description,
      required DateTime dataSelecionada,
      String? horaInicial,
      String? horaFinal}) async {
    var horaStartSelected = horaInicial?.split(":");

    var horainicial = horaStartSelected?[0];
    var minutoinicial = horaStartSelected?[1];

    var dataInicial = DateTime(
        dataSelecionada.year,
        dataSelecionada.month,
        dataSelecionada.day,
        int.tryParse(horainicial ?? "0") ?? 0,
        int.tryParse(minutoinicial ?? "0") ?? 0);

    var horaEndSelected = horaFinal?.split(":");

    var horafinal = horaEndSelected?[0];
    var minutofinal = horaEndSelected?[1];

    var dataFinal = DateTime(
        dataSelecionada.year,
        dataSelecionada.month,
        dataSelecionada.day,
        int.tryParse(horafinal ?? "0") ?? 0,
        int.tryParse(minutofinal ?? "0") ?? 0);

    Tasks tasks = Tasks(
      task: task,
      description: description,
      startDate: dataInicial,
      endDate: dataFinal,
    );

    var uuid = await repository.saveTask(tasks);
    var updateTask = tasks.copyWith(uuid: uuid);
    await repository.updateTask(updateTask);
  }
}
