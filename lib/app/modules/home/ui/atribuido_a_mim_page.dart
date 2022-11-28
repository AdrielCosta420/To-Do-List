import 'package:flutter/material.dart';

class AtribuidoAMimPage extends StatefulWidget {
  const AtribuidoAMimPage({Key? key}) : super(key: key);

  @override
  State<AtribuidoAMimPage> createState() => _AtribuidoAMimPageState();
}

Color colorsAtribuido = const Color.fromARGB(255, 33, 243, 173);

class _AtribuidoAMimPageState extends State<AtribuidoAMimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: colorsAtribuido,
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    'Atribuído a mim',
                    style: TextStyle(
                        color: colorsAtribuido,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SizedBox(
                height: 210,
                width: 210,
                child: Image.asset('assets/images/atribuidopage.png'),
              ),
            ),
            Text(
              'As tarefas atribuídas a \n você aparecem aqui.',
              style: TextStyle(
                color: colorsAtribuido,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorsAtribuido,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
