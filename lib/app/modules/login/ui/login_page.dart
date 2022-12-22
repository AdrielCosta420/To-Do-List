import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/app/modules/login/domain/entities/login.dart';
import 'package:to_do_app/app/modules/login/presenter/controllers/login_store.dart';
import 'package:to_do_app/app/modules/login/presenter/usecases/logar_usuario_uc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();
  final LogarUsuarioUc logarUsuarioUc = Modular.get();
  final controllerSenha = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final controllerLogin = TextEditingController();

  @override
  void initState() {
    store.isLoadingChange();
    if (FirebaseAuth.instance.currentUser != null) {
      Modular.to.pushReplacementNamed('/home/');
    } else {
      store.isLoadingChange();
    }
    super.initState();
  }

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
                Color.fromARGB(255, 27, 18, 61),
                Color.fromARGB(255, 42, 29, 92),
                Color.fromARGB(255, 27, 18, 61),

                //Color.fromARGB(185, 71, 34, 202),
                //Color.fromARGB(255, 27, 18, 61),
                //Color.fromARGB(255, 27, 18, 61),
                //Color.fromARGB(255, 124, 98, 219),

                // Color.fromARGB(255, 68, 20, 238),
                //Color.fromARGB(185, 2, 17, 16),
                // Color.fromARGB(255, 124, 98, 219),
              ],
            ),
          ),
          child: Observer(
            builder: (_) {
              return store.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 80, left: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Bem vindo',
                                style: GoogleFonts.notoSansWarangCiti(
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
                                  builder: (_) {
                                    return Form(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 15,
                                                right: 30,
                                                left: 20,
                                                top: 35),
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              controller: controllerLogin,
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                              decoration: InputDecoration(
                                                focusColor: Colors.yellow,
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  gapPadding: 20,
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                ),
                                                border:
                                                    const OutlineInputBorder(
                                                  gapPadding: 20,
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                ),
                                                disabledBorder:
                                                    const OutlineInputBorder(
                                                  gapPadding: 20,
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                ),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  gapPadding: 20,
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                ),
                                                hintText:
                                                    'ex: adriel@teste.com',
                                                hintStyle: const TextStyle(
                                                    color: Colors.white30),
                                                label: Text(
                                                  'Email',
                                                  style: GoogleFonts
                                                      .notoSansWarangCiti(
                                                          color: Colors.white),
                                                ),
                                                icon: const Icon(
                                                  Icons.login,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 15,
                                                right: 30,
                                                left: 20,
                                                top: 15),
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              controller: controllerSenha,
                                              obscureText:
                                                  store.mostraSenha.value,
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                              decoration: InputDecoration(
                                                focusColor: Colors.white,
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  gapPadding: 20,
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                ),
                                                border:
                                                    const OutlineInputBorder(
                                                  gapPadding: 20,
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                ),
                                                disabledBorder:
                                                    const OutlineInputBorder(
                                                  gapPadding: 20,
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                ),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  gapPadding: 20,
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                ),
                                                hintText: 'ex: ********',
                                                hintStyle: const TextStyle(
                                                    color: Colors.white30),
                                                label: Text(
                                                  'Senha',
                                                  style: GoogleFonts
                                                      .notoSansWarangCiti(
                                                          color: Colors.white),
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
                                                        ? Icons
                                                            .visibility_off_outlined
                                                        : Icons
                                                            .visibility_outlined,
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
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 124, 98, 219),
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(22),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                logarUsuarioUc(
                                                  Login(
                                                      email:
                                                          controllerLogin.text,
                                                      senha:
                                                          controllerSenha.text),
                                                );
                                              },
                                              child: !store.isLoading
                                                  ? Text(
                                                      'ENTRAR',
                                                      style: GoogleFonts
                                                          .notoSansWarangCiti(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    )
                                                  : const SizedBox(
                                                      height: 24,
                                                      width: 24,
                                                      child:
                                                          CircularProgressIndicator(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          child: Text(
                                            'Cadastrar-se',
                                            style:
                                                GoogleFonts.notoSansWarangCiti(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              //fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          onPressed: () => Modular.to
                                              .pushNamed('/cadastro/'),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      child: Text(
                                        'Esqueceu sua senha?',
                                        style: GoogleFonts.notoSansWarangCiti(
                                          color: Colors.white,
                                          fontSize: 15,
                                          // fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      onPressed: () => Modular.to
                                          .pushNamed('/esqueceuSenha/'),
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
                              style: GoogleFonts.notoSansWarangCiti(
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
