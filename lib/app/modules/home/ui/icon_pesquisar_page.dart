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
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SizedBox(
                child: Image.asset('assets/images/search.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
