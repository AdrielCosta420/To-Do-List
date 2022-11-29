import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class HomeStore {
  final escolhaTema = Observable<int>(0);

  void escolhaTemaChange(int value) =>
      runInAction(() => escolhaTema.value = value);

  List<String> photos = [
    'assets/bg/op1.png',
    'assets/bg/op2.png',
    'assets/bg/op3.png',
    'assets/bg/op4.png',
  ];

  final fotoEscolhida = Observable<String>('assets/bg/op1.png');

  void fotoEscolhidaChange(String value) => runInAction(
        () => fotoEscolhida.value = value,
      );

  List<Color> colors = const [
    Colors.blue,
    Colors.greenAccent,
    Colors.teal,
    Colors.redAccent,
    Colors.amberAccent,
    Color.fromARGB(185, 255, 255, 255)
  ];

  final corEscolhida = Observable<Color>(Colors.blue);

  void corEscolhidaChange(Color value) => runInAction(
        () => corEscolhida.value = value,
      );
}
