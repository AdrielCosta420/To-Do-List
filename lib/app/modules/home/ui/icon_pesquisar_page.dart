import 'package:flutter/material.dart';

class IconPesquisarPage extends StatefulWidget {
  const IconPesquisarPage({Key? key}) : super(key: key);

  @override
  State<IconPesquisarPage> createState() => _IconPesquisarPageState();
}

class _IconPesquisarPageState extends State<IconPesquisarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Pesquisar',
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/p1.png'),
              ),
            ),
            const Text(
              'Procuramos em toda a parte, mas não \nencontramos o que você está procurando.',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
