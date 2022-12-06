import 'package:flutter/material.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({Key? key}) : super(key: key);

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF388bfe),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    'Tarefas',
                    style: TextStyle(
                        color: Color(0xFF388bfe),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 350,
              width: 350,
              child: Image.asset('assets/images/op2tarefa.png'),
            ),
            const Text(
              'Tente classificar com \n estrelas algumas tarefas \n para vê-las aqui.',
              style: TextStyle(
                color: Color(0xFF388bfe),
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF388bfe),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
