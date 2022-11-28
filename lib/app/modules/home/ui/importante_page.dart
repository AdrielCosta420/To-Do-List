import 'package:flutter/material.dart';

class ImportantePage extends StatefulWidget {
  const ImportantePage({Key? key}) : super(key: key);

  @override
  State<ImportantePage> createState() => _ImportantePageState();
}

class _ImportantePageState extends State<ImportantePage> {
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
            color: Color.fromARGB(255, 194, 103, 212),
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
                    'Importante',
                    style: TextStyle(
                        color: Color.fromARGB(255, 194, 103, 212),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 350,
              width: 350,
              child: Image.asset('assets/images/list.png'),
            ),
            const Text(
              'Tente classificar com \n estrelas algumas tarefas \n para vê-las aqui.',
              style: TextStyle(
                color: Color.fromARGB(255, 194, 103, 212),
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 194, 103, 212),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
