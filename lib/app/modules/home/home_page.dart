import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/login/domain/entities/login.dart';
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

final TextEditingController todoController = TextEditingController();
List<String> todos = [];

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();
  final HomeDatasourceDatasourceImpl homeDatasourceDatasourceImpl =
      Modular.get();
  

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
            ListTile(
              title: const Text(
                'inserir email',
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
              trailing: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const IconPesquisarPage(),
                  ),
                ),
                color: Colors.white,
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
            const Divider(
              color: Colors.white,
              thickness: 0.2,
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
                onPressed: () {},
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
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void clearText() {
    todoController.clear();
  }
}
