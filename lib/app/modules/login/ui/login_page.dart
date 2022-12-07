import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/app/modules/login/data/datasource/login_datasource_impl.dart';
import 'package:to_do_app/app/modules/login/presenter/controllers/login_store.dart';
import 'package:to_do_app/app/modules/login/presenter/usecases/logar_usuario_impl.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();
  final LoginDatasourceImpl datasourceImpl = Modular.get();
  final LogarUsuarioUcImpl logarUsuarioUcImpl = Modular.get();
  final controllerSenha = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final controllerLogin = TextEditingController();

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
                Color.fromARGB(255, 124, 98, 219),
                Color.fromARGB(186, 43, 190, 175),
                Color.fromARGB(255, 124, 98, 219),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bem vindo',
                      style: GoogleFonts.adamina(
                        letterSpacing: 1,
                        color: Colors.white,
                        fontSize: 40,
                        shadows: const [
                          Shadow(
                            offset: Offset(0.9, 0.9),
                            blurRadius: 2,
                            color: Colors.black,
                          ),
                        ],
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
                      margin: const EdgeInsets.only(bottom: 60),
                      elevation: 10,
                      color: const Color.fromARGB(6, 0, 0, 0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Observer(
                        builder: (context) {
                          return Form(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, right: 30, left: 20, top: 35),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: controllerLogin,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: const InputDecoration(
                                      focusColor: Colors.yellow,
                                      focusedBorder: OutlineInputBorder(
                                        gapPadding: 20,
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        gapPadding: 20,
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        gapPadding: 20,
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        gapPadding: 20,
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      hintText: 'ex: adriel@teste.com',
                                      hintStyle:
                                          TextStyle(color: Colors.white30),
                                      label: Text(
                                        'Email',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      icon: Icon(
                                        Icons.login,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, right: 30, left: 20, top: 15),
                                  child: TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: controllerSenha,
                                    obscureText: store.mostraSenha.value,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                      focusColor: Colors.yellow,
                                      focusedBorder: const OutlineInputBorder(
                                        gapPadding: 20,
                                        borderSide:
                                            BorderSide(color: Colors.yellow),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      border: const OutlineInputBorder(
                                        gapPadding: 20,
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      disabledBorder: const OutlineInputBorder(
                                        gapPadding: 20,
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        gapPadding: 20,
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      hintText: 'ex: ********',
                                      hintStyle: const TextStyle(
                                          color: Colors.white30),
                                      label: const Text(
                                        'Senha',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      icon: const Icon(
                                        Icons.password,
                                        color: Colors.white,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          store.mostraSenhaChange();
                                        },
                                        icon: Icon(
                                          store.mostraSenha.value
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  width: 300,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(22),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      logarUsuarioUcImpl.repository.login(
                                          controllerLogin.text,
                                          controllerSenha.text);
                                      Modular.to.pushNamed('/home/');

                                      controllerLogin.clear();
                                      controllerSenha.clear();
                                      store.isLoadingChange();
                                    },
                                    child: !store.isLoading
                                        ? const Text(
                                            'ENTRAR',
                                            style: TextStyle(
                                              color:
                                                  Color.fromARGB(225, 0, 0, 0),
                                            ),
                                          )
                                        : const SizedBox(
                                            height: 24,
                                            width: 24,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 3,
                                              color: Colors.green,
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(22),
                              ),
                            ),
                            child: Container(
                              width: 150,
                              height: 40,
                              child: TextButton(
                                child: const Text(
                                  'Cadastrar-se',
                                  style: TextStyle(
                                    color: Color.fromARGB(137, 0, 0, 0),
                                    fontSize: 18,
                                    //fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onPressed: () =>
                                    Modular.to.pushNamed('/cadastro/'),
                              ),
                            ),
                          ),
                          TextButton(
                            child: const Text(
                              'Esqueceu sua senha?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                // fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: () =>
                                Modular.to.pushNamed('/esqueceuSenha/'),
                          ),
                        ],
                      ),
                    ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
