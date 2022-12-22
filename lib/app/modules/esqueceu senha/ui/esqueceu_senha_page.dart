import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/app/modules/esqueceu%20senha/data/datasource/esqueceu_senha_datasource_impl.dart';

class EsqueceuSenhaPage extends StatefulWidget {
  const EsqueceuSenhaPage({Key? key}) : super(key: key);

  @override
  State<EsqueceuSenhaPage> createState() => _EsqueceuSenhaPageState();
}

class _EsqueceuSenhaPageState extends State<EsqueceuSenhaPage> {
  final EsqueceuSenhaDatasourceImpl esqueceuSenhaDatasourceImpl = Modular.get();

  TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 27, 18, 61),
        child: const Icon(
          Icons.arrow_back_ios,
          size: 25,
        ),
        onPressed: () => Modular.to.pop(),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                // Color.fromARGB(185, 71, 34, 202),
                Color.fromARGB(255, 27, 18, 61),
                Color.fromARGB(255, 27, 18, 61),
                Color.fromARGB(255, 27, 18, 61),
                // Color.fromARGB(255, 124, 98, 219),
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
                  Text(
                    'Esqueceu sua senha?',
                    style: GoogleFonts.notoSansWarangCiti(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 18, left: 40, right: 20),
                    child: Text(
                      'Por favor, insira o email associado a sua conta para \nque possamos enviar um link para o mesmo com as instruções para a restauração de sua senha!',
                      style:
                          GoogleFonts.notoSansWarangCiti(color: Colors.white38),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: TextFormField(
                  controller: controllerEmail,
                  decoration: InputDecoration(
                    label: Text(
                      'Email',
                      style: GoogleFonts.notoSansWarangCiti(
                        fontSize: 20,
                        color: Colors.white70,
                      ),
                    ),
                    hintText: 'insira aqui seu email',
                    hintStyle: const TextStyle(color: Colors.white38),
                    focusedBorder: const OutlineInputBorder(
                      gapPadding: 20,
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: const OutlineInputBorder(
                      gapPadding: 20,
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      gapPadding: 20,
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      gapPadding: 20,
                      borderSide: BorderSide(color: Colors.white),
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
                  onPressed: () {
                    esqueceuSenhaDatasourceImpl
                        .esqueceuSenha(controllerEmail.text)
                        .then((value) {})
                        .catchError((e) => print(e.toString()));
                    Modular.to.pushNamed('/login/');
                  },
                  child: Text(
                    'ENVIAR',
                    style: GoogleFonts.notoSansWarangCiti(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
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
