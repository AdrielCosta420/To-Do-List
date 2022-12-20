import 'package:emojis/emojis.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/app/modules/home/ui/criar_task.page.dart';
import 'package:to_do_app/app/modules/tasks/domain/usecases/get_all_tasks.dart';
import 'package:to_do_app/app/modules/tasks/domain/usecases/update_task_uc.dart';
import 'package:to_do_app/app/widgets/check_box_list_custom_widget.dart';
import '../../../widgets/text_form_field_custom_widget.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

bool check = false;

class _TaskPageState extends State<TaskPage> {
  final GetAllTasks getAllTasks = Modular.get();
  final UpdateTaskUc updateTaskUc = Modular.get();
  bool checkTask = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Olá, Adriel! ${Emojis.wavingHandMediumSkinTone}',
                    style: GoogleFonts.notoSansWarangCiti(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                  trailing: SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        child: Image.asset('assets/images/profile.png',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                const TextFormFieldCustomWidget(hintText: 'Pesquisar tarefas'),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Tarefas de hoje',
                        style: GoogleFonts.notoSansWarangCiti(
                          color: Colors.white60,
                          fontSize: 25,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: StreamBuilder(
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
                      return ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          var task = tasks[index];
                          return GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ExpansionTileCard(
                                expandedColor: Colors.red,
                                title: Text(
                                  task.task,
                                  style: const TextStyle(color: Colors.white),
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
                                  Text(task.description!),
                                  Text("data"),
                                  Text("data"),
                                  Text("data"),
                                  Text("data"),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Row(
          children: [
            Expanded(
              child: FloatingActionButton(
                heroTag: 'btnhome',
                backgroundColor: Colors.black,
                onPressed: () {},
                child: const Icon(
                  Icons.home_filled,
                ),
              ),
            ),
            Expanded(
              child: FloatingActionButton(
                heroTag: 'btnindice',
                backgroundColor: Colors.black,
                onPressed: () {},
                child: const Icon(
                  Icons.table_rows_outlined,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  width: 100,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff95baf6),
                        Color(0xff95baf6),
                        Color(0xffab9eef),
                        Color(0xffab9eef),
                        Color(0xffbe89ea),
                      ],
                    ),
                  ),
                  child: IconButton(
                    onPressed: () => Modular.to.push(MaterialPageRoute(
                        builder: (context) => const CriarTaskPage())),
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FloatingActionButton(
                heroTag: 'btncalendario',
                backgroundColor: Colors.black,
                onPressed: () {},
                child: const Icon(
                  Icons.date_range_outlined,
                ),
              ),
            ),
            Expanded(
              child: FloatingActionButton(
                heroTag: 'btnperson',
                backgroundColor: Colors.black,
                onPressed: () {},
                child: const Icon(
                  Icons.person_outline_rounded,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

/////////////////
/* 
FloatingActionButton(
                    heroTag: 'btnadd',
                    backgroundColor: Colors.transparent,
                    //const Color.fromARGB(255, 124, 98, 219),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CriarTaskPage(),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 35,
                    ),
                  )*/