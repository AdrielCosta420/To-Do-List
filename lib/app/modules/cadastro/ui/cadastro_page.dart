import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:string_validator/string_validator.dart' as validate;
import 'package:to_do_app/app/modules/cadastro/controllers/cadastro_store.dart';
import 'package:to_do_app/app/modules/cadastro/presenter/usecases/cadastrar_usuario_impl_uc.dart';

import '../domain/cadastro.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final CadastroStore store = Modular.get();
  final cadastrarUsuarioImplUc = Modular.get<CadastrarUsuarioImplUc>();
  final controllerNome = TextEditingController();
  final controllerLogin = TextEditingController();
  final controllerSenha = TextEditingController();
  final controllerRepeteSenha = TextEditingController();
  final formKey = GlobalKey<FormState>();

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

                /* Color.fromARGB(185, 71, 34, 202),
                Color.fromARGB(255, 27, 18, 61),
                Color.fromARGB(255, 27, 18, 61),
                Color.fromARGB(255, 124, 98, 219),
                //Color.fromARGB(186, 43, 190, 175),*/
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cadastro',
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
                      margin: const EdgeInsets.only(bottom: 20),
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
                            key: formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 30, left: 20, top: 35),
                                  child: TextFormField(
                                    controller: controllerNome,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: const InputDecoration(
                                      focusColor: Colors.yellow,
                                      focusedBorder: OutlineInputBorder(
                                        gapPadding: 20,
                                        borderSide:
                                            BorderSide(color: Colors.yellow),
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
                                      label: Text(
                                        'Nome',
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
                                      bottom: 15, right: 30, left: 20, top: 35),
                                  child: TextFormField(
                                    controller: controllerLogin,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (!validate.isEmail(value ?? '')) {
                                        return 'Email inválido!';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: const InputDecoration(
                                      focusColor: Colors.yellow,
                                      focusedBorder: OutlineInputBorder(
                                        gapPadding: 20,
                                        borderSide:
                                            BorderSide(color: Colors.yellow),
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
                                    obscureText: store.passwordVisible.value,
                                    validator: (value) {
                                      if (value!.length < 6) {
                                        return 'Senha muito curta!';
                                      }
                                      return null;
                                    },
                                    controller: controllerSenha,
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
                                          store.passwordVisibleChange();
                                        },
                                        icon: Icon(
                                          store.passwordVisible.value
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, right: 30, left: 20, top: 15),
                                  child: Observer(
                                    builder: (_) {
                                      return TextFormField(
                                        obscureText:
                                            store.confirmPasswordVisible.value,
                                        controller: controllerRepeteSenha,
                                        validator: (value) {
                                          if (controllerSenha.text !=
                                              controllerRepeteSenha.text) {
                                            return 'As senhas não conferem!';
                                          }
                                          return null;
                                        },
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                        decoration: InputDecoration(
                                          focusColor: Colors.yellow,
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            gapPadding: 20,
                                            borderSide: BorderSide(
                                                color: Colors.yellow),
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
                                          disabledBorder:
                                              const OutlineInputBorder(
                                            gapPadding: 20,
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
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
                                            'Repita sua senha',
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
                                              store
                                                  .confirmPasswordVisibleChange();
                                            },
                                            icon: Icon(
                                              store.confirmPasswordVisible.value
                                                  ? Icons
                                                      .visibility_off_outlined
                                                  : Icons.visibility_outlined,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
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
                                      if (formKey.currentState?.validate() ??
                                          false) {
                                        var cadastro = Cadastro(
                                            email: controllerLogin.text,
                                            senha: controllerSenha.text,
                                            nome: controllerNome.text);
                                        cadastrarUsuarioImplUc.call(
                                            cadastro, context);
                                      }
                                      store.isLoadingCadChange();
                                    },
                                    child: !store.isLoadingCad
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
                                              color: Colors.green,
                                              strokeWidth: 3,
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
                  ],
                ),
              ),
              FloatingActionButton.extended(
                backgroundColor: const Color.fromARGB(87, 0, 0, 0),
                label: const Text(
                  'VOLTAR',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => Modular.to.pop(),
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
