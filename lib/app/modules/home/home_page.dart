import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart' show Modular;
import 'package:to_do_app/app/modules/configuracoes/ui/configuracoes_page.dart';
import 'controllers/home_store.dart';
import 'package:flutter/material.dart';
import 'data/datasource/home_datasource_datasource_impl.dart';
import 'ui/atribuido_a_mim_page.dart';
import 'ui/icon_pesquisar_page.dart';
import 'ui/importante_page.dart';
import 'ui/meu_dia_page.dart';
import 'ui/planejado_page.dart';
import 'ui/tarefas_page.dart';
import 'widgets/list_tile_custom_widget.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({
    Key? key,
    this.title = 'HomePage',
  }) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

final todoController = TextEditingController();
List<String> newTarefas = [];

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();
  final HomeDatasourceDatasourceImpl homeDatasourceDatasourceImpl =
      Modular.get();

  void mostrarDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(188, 54, 227, 240),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            title: const Text(
              'Adicionar tarefa',
              style: TextStyle(fontSize: 25),
            ),
            content: TextField(
              controller: todoController,
              decoration: const InputDecoration(
                label: Text('nova tarefa'),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Modular.to.pop();
                },
                child: const Text(
                  'CANCELAR',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  addTarefa();
                  Modular.to.pop();
                },
                child: const Text(
                  'ADICIONAR',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        });
  }

  void addTarefa() {
    setState(() {
      Map<String, dynamic> novoTodo = Map();
      novoTodo['title'] = todoController.text;
      todoController.text = '';
      novoTodo['ok'] = false;
      newTarefas.add(novoTodo.toString());
    });
  }

  /* 
      todoController.text;
      var novoTodo = todoController.text = '';

      newTarefas.add(novoTodo.toString());
      */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: const Text(
                      'inserir nome do usuario',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 13, 241, 20),
                      ),
                    ),
                    subtitle: const Text(
                      'inserir email',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: SizedBox(
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
                    trailing: PopupMenuButton(
                      color: const Color.fromARGB(153, 0, 0, 0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Icon(
                        Icons.more_vert_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Column(
                            children: [
                              ListTileCustomWidget(
                                icon: Icons.search,
                                iconColor: Colors.white54,
                                title: 'Pesquisar',
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const IconPesquisarPage(),
                                  ),
                                ),
                              ),
                              ListTileCustomWidget(
                                icon: Icons.settings,
                                iconColor: Colors.white54,
                                title: 'Configurações',
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ConfiguracoesPage(),
                                  ),
                                ),
                              ),
                              ListTileCustomWidget(
                                icon: Icons.add,
                                iconColor: Colors.white54,
                                title: 'Adicionar conta',
                                onTap: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  ListTileCustomWidget(
                    icon: Icons.wb_sunny_outlined,
                    iconColor: Colors.white,
                    title: 'Meu Dia',
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const MeuDiaPage(),
                      ),
                    ),
                  ),
                  ListTileCustomWidget(
                    icon: Icons.star_border,
                    iconColor: const Color.fromARGB(255, 194, 103, 212),
                    title: 'Importante',
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const ImportantePage(),
                      ),
                    ),
                  ),
                  ListTileCustomWidget(
                    icon: Icons.my_library_books_outlined,
                    iconColor: const Color.fromARGB(255, 30, 224, 238),
                    title: 'Planejado',
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => PlanejadoPage(),
                      ),
                    ),
                  ),
                  ListTileCustomWidget(
                    icon: Icons.person_outline_rounded,
                    iconColor: const Color.fromARGB(255, 33, 243, 173),
                    title: 'Atríbuido a mim',
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const AtribuidoAMimPage(),
                      ),
                    ),
                  ),
                  ListTileCustomWidget(
                    icon: Icons.fact_check_outlined,
                    iconColor: const Color.fromARGB(255, 68, 125, 172),
                    title: 'Tarefas',
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const TarefasPage(),
                      ),
                    ),
                  ),
                  /*ListTileCustomWidget(
                  icon: Icons.abc_outlined,
                  iconColor: Colors.red,
                  title: '$newTarefas',
                  onTap: () {},
                ),*/

                  //TODO ADD
                  /*    ListView.builder(
                  itemCount: newTarefas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('$newTarefas'),
                    );
                  },
                ),*/
                  const Divider(
                    color: Colors.white,
                    thickness: 0.2,
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    mostrarDialog();
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white54,
                    size: 30,
                  ),
                  label: const Text(
                    'Nova lista',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white54,
                    ),
                  ),
                  backgroundColor: Colors.black,
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    TextButton(
                      child: const Text(
                        'SAIR',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        homeDatasourceDatasourceImpl.logout();
                        Navigator.popAndPushNamed(context, '/');
                        store.isLoadingHomeChange();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void clearText() {
    todoController.clear();
  }
}

/*
shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),*/