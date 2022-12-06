import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/esqueceu%20senha/data/datasource/esqueceu_senha_datasource_impl.dart';

class EsqueceuSenhaPage extends StatelessWidget {
  EsqueceuSenhaPage({Key? key}) : super(key: key);

  final EsqueceuSenhaDatasourceImpl esqueceuSenhaDatasourceImpl = Modular.get();
  TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(186, 43, 190, 175),
                Color.fromARGB(255, 126, 182, 214),
                Color.fromARGB(255, 55, 226, 248),
                Color.fromARGB(186, 43, 190, 175),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: Image.asset('assets/images/esqueceuSenha.png'),
                  ),
                  const Text(
                    'Esqueceu sua senha?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 18, left: 40, right: 20),
                    child: Text(
                      'Por favor, insira o email associado a sua conta para \nque possamos enviar um link para o mesmo com as instruções para a restauração de sua senha!',
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: TextFormField(
                  controller: controllerEmail,
                  decoration: const InputDecoration(
                    label: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 124, 98, 219),
                  ),
                  onPressed: () => esqueceuSenhaDatasourceImpl
                      .esqueceuSenha(email: controllerEmail.text)
                      .then((value) {
                    print('Email enviado com sucesso!');
                  }).catchError((e) => print(e.toString())),
                  child: const Text(
                    'ENVIAR',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
