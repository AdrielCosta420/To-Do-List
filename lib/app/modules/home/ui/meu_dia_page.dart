import 'package:flutter/material.dart';

class MeuDiaPage extends StatefulWidget {

  const MeuDiaPage({ Key? key }) : super(key: key);

  @override
  State<MeuDiaPage> createState() => _MeuDiaPageState();
}

class _MeuDiaPageState extends State<MeuDiaPage> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Container(),
       );
  }
}