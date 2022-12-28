import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/app/modules/tasks/domain/usecases/get_all_tasks.dart';
import 'package:to_do_app/app/modules/tasks/domain/usecases/update_task_uc.dart';
import 'package:to_do_app/app/modules/tasks/presenter/controllers/tasks_store.dart';

class AllTasksPage extends StatefulWidget {
  const AllTasksPage({Key? key}) : super(key: key);

  @override
  State<AllTasksPage> createState() => _AllTasksPageState();
}

class _AllTasksPageState extends State<AllTasksPage> {
  final GetAllTasks getAllTasks = Modular.get();
  final UpdateTaskUc updateTaskUc = Modular.get();
  final TasksStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: getAllTasks.call(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Erro ao buscar"),
            );
          }

          var tasks = snapshot.data ?? [];

          if (tasks.isEmpty) {
            return Center(
              child: Text(
                "Você não possui tarefas",
                style: GoogleFonts.notoSansWarangCiti(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            );
          }
          return Container(
            height: MediaQuery.of(context).size.height - tasks.length,
            color: Colors.white30,
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                var task = tasks[index];
                return GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpansionTileCard(
                      baseColor: task.priority == "ALTA"
                          ? Colors.red
                          : task.priority == "MEDIA"
                              ? Colors.yellow
                              : task.priority == "BAIXA"
                                  ? Colors.green
                                  : const Color.fromARGB(200, 75, 74, 74),
                      expandedColor: const Color.fromARGB(200, 75, 74, 74),
                      title: Text(
                        task.task,
                        style: GoogleFonts.notoSansWarangCiti(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      trailing: Checkbox(
                        value: task.check,
                        onChanged: (value) => updateTaskUc.call(
                          task.copyWith(check: value),
                        ),
                        activeColor: Colors.green,
                        shape: const CircleBorder(),
                      ),
                      children: [
                        const Divider(
                          thickness: 2,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  'Descrição:',
                                  style: GoogleFonts.notoSansWarangCiti(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                task.description ?? '',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
