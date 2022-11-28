import 'package:flutter/material.dart';

class MeuDiaPage extends StatefulWidget {
  const MeuDiaPage({Key? key}) : super(key: key);

  @override
  State<MeuDiaPage> createState() => _MeuDiaPageState();
}

class _MeuDiaPageState extends State<MeuDiaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 53, 54),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.network(
            'https://images.unsplash.com/photo-1559583985-c80d8ad9b29f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwxMDY1OTc2fHxlbnwwfHx8fA%3D%3D&w=1000&q=80',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 30,
            child: FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(
                Icons.lightbulb_outline,
                color: Colors.amber,
              ),
              label: const Text('SUGESTÕES'),
              backgroundColor: const Color.fromARGB(255, 76, 83, 146),
            ),
          ),
        ],
      ),
    );
  }
}
