import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emojis/emojis.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/app/modules/home/ui/criar_task.page.dart';
import 'package:to_do_app/app/modules/login/domain/entities/usuario.dart';
import 'package:to_do_app/app/modules/tasks/domain/usecases/get_all_tasks.dart';
import 'package:to_do_app/app/modules/tasks/domain/usecases/update_task_uc.dart';
import 'package:to_do_app/app/modules/tasks/ui/profile_page.dart';
import 'package:to_do_app/common/constants/firebase_colections.dart';

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
  Usuario usuario =
      Usuario(nome: "", dataNascimento: DateTime.now(), email: "");

  buscarUsuario() async {
    final firestore = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;

    final uuid = auth.currentUser?.uid;

    if (uuid != null) {
      var doc = await firestore.collection(usuariosCollection).doc(uuid).get();
      if (doc.data() != null) {
        setState(() {
          usuario = Usuario.fromMap(doc.data() ?? {});
        });
      }
    }
  }

  @override
  void initState() {
    buscarUsuario();
    super.initState();
  }

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
                  title: InkWell(
                    onTap: () => print(usuario.nome),
                    child: Text(
                      'Olá, ${usuario.nome}! ${Emojis.wavingHandMediumSkinTone}',
                      style: GoogleFonts.notoSansWarangCiti(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
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
                                  style: const TextStyle(color: Colors.red),
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
                                  Text(task.description ?? '**********'),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 10, 162, 189),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home_filled,
                  size: 26,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.table_rows_outlined,
                    color: Colors.black,
                    size: 26,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 35),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.date_range_outlined,
                    color: Colors.black,
                    size: 26,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person_outline_rounded,
                  color: Colors.black,
                  size: 26,
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

/////////////////
/* 
 Container(
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
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage())),
                child: const Icon(
                  Icons.person_outline_rounded,
                ),
              ),
            ),
          ],
        ),
      ),
                  )*/