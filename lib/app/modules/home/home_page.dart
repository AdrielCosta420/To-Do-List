import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/app/modules/home/ui/importante_page.dart';
import 'package:to_do_app/app/modules/home/ui/meu_dia_page.dart';
import 'package:to_do_app/app/modules/home/widgets/list_tile_custom_widget.dart';

class HomePage extends StatefulWidget {
  final String title;

  String nome = 'Adriel';
  HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

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
                'Adriel Costa',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 13, 241, 20),
                ),
              ),
              subtitle: const Text(
                'adrielsilva@hotmail.com',
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
                onPressed: () {},
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
                  builder: (_) => const MeuDiaPage(),
                ),
              ),
            ),
            ListTileCustomWidget(
              icon: Icons.person_outline_rounded,
              iconColor: const Color.fromARGB(255, 33, 243, 173),
              title: 'Atríbuido a mim',
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const MeuDiaPage(),
                ),
              ),
            ),
            ListTileCustomWidget(
              icon: Icons.fact_check_outlined,
              iconColor: const Color.fromARGB(255, 68, 125, 172),
              title: 'Tarefas',
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const MeuDiaPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        title: Text(widget.title),
        leading: const CircleAvatar(
          backgroundColor: Color.fromARGB(255, 19, 173, 219),
          radius: 25,
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      )
      */