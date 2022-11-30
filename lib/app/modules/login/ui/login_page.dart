import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 124, 98, 219),
              Color.fromARGB(186, 43, 190, 175),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 13),
              child: Row(
                children: [
                  Text(
                    'Bem vindo',
                    style: GoogleFonts.lobster(
                      color: Colors.white,
                      fontSize: 50,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(11),
              child: Column(
                children: [
                  Card(
                    elevation: 10,
                    color: Color.fromARGB(131, 0, 0, 0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, right: 30, left: 20, top: 15),
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'ex: adriel@teste.com',
                              hintStyle: TextStyle(color: Colors.white30),
                              label: Text(
                                'EMAIL',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              icon: Icon(
                                Icons.login,
                                color: Color(0xFF6a3ffa),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, right: 30, left: 20, top: 15),
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'ex: ********',
                              hintStyle: TextStyle(color: Colors.white30),
                              label: Text(
                                'SENHA',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              icon: Icon(
                                Icons.password,
                                color: Color(0xFF6a3ffa),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6a3ffa),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(22),
                              ),
                            ),
                          ),
                          onPressed: () => Modular.to.pushNamed('/home/'),
                          child: const Text('ENTRAR'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: Text(
                            'Esqueceu sua senha?',
                            style: GoogleFonts.adamina(
                              color: Colors.white,
                              fontSize: 15,
                              // fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {},
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF6a3ffa),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          child: TextButton(
                            child: Text(
                              'Cadastrar-se',
                              style: GoogleFonts.adamina(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  /* Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      
                    ],
                  ),*/
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Criado e desenvolvido por Adriel',
                  style: GoogleFonts.macondo(color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
