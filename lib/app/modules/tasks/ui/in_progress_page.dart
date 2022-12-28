import 'package:flutter/material.dart';

class InProgressPage extends StatefulWidget {
  const InProgressPage({Key? key}) : super(key: key);

  @override
  State<InProgressPage> createState() => _InProgressPageState();
}

class _InProgressPageState extends State<InProgressPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Você não tem tarefas em progresso',
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
