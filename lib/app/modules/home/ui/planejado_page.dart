import 'package:flutter/material.dart';

class PlanejadoPage extends StatefulWidget {
  PlanejadoPage({Key? key}) : super(key: key);

  @override
  State<PlanejadoPage> createState() => _PlanejadoPageState();
}

Color colorsPlanejado = const Color.fromARGB(255, 30, 224, 238);

class _PlanejadoPageState extends State<PlanejadoPage> {
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
            color: colorsPlanejado,
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
                    'Planejado',
                    style: TextStyle(
                        color: colorsPlanejado,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120),
              child: SizedBox(
                height: 400,
                width: 400,
                child: Image.asset('assets/images/op2.png'),
              ),
            ),
            Text(
              'As tarefas com datas de \n conclusão ou lembretes \n aparecem aqui',
              style: TextStyle(
                color: colorsPlanejado,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorsPlanejado,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
