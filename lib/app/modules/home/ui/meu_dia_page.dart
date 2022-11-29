import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/home/controllers/home_store.dart';

class MeuDiaPage extends StatefulWidget {
  const MeuDiaPage({Key? key}) : super(key: key);

  @override
  State<MeuDiaPage> createState() => _MeuDiaPageState();
}

class _MeuDiaPageState extends State<MeuDiaPage> {
  final HomeStore store = Modular.get();

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
        actions: [
          PopupMenuButton(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            color: const Color.fromARGB(143, 0, 0, 0),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.color_lens_outlined,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Alterar tema',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        var alert = AlertDialog(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          backgroundColor: Colors.transparent,
                          title: const Text(
                            'Selecione um tema',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Observer(
                            builder: (_) {
                              return SizedBox(
                                width: 300,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    store.escolhaTema.value == 0
                                                        ? const Color.fromARGB(
                                                            255, 29, 185, 206)
                                                        : Colors.white),
                                            onPressed: () {
                                              store.escolhaTemaChange(0);
                                            },
                                            child: const Text('cor',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                              ),
                                              backgroundColor:
                                                  store.escolhaTema.value == 1
                                                      ? const Color.fromARGB(
                                                          255, 29, 185, 206)
                                                      : Colors.white,
                                            ),
                                            onPressed: () {
                                              store.escolhaTemaChange(1);
                                            },
                                            child: const Text(
                                              'foto',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    store.escolhaTema.value == 0
                                        ? SizedBox(
                                            height: 50,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: store.colors.length,
                                              itemBuilder: (context, index) =>
                                                  Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    store.corEscolhidaChange(
                                                        store.colors[index]);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    color: store.colors[index],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : SizedBox(
                                            height: 50,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: store.photos.length,
                                              itemBuilder: (context, index) =>
                                                  SizedBox(
                                                height: 40,
                                                width: 40,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      store.fotoEscolhidaChange(
                                                          store.photos[index]);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Image.asset(
                                                      store.photos[index],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                        showDialog(
                            context: context, builder: (context) => alert);
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.swap_vert_outlined,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Classificar por',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        var alert2 = const AlertDialog(
                          title: Text(
                            'Classificar por',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          actions: [
                            ListTile(
                              leading: Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Importância',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.date_range_outlined,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Data de conclusão',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.swap_vert_outlined,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Em ordem alfabética',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                        showDialog(
                            context: context, builder: (context) => alert2);
                      },
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.share_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Enviar uma cópia',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              store.escolhaTema.value == 0
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: store.corEscolhida.value,
                    )
                  : Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          store.fotoEscolhida.value,
                          fit: BoxFit.cover,
                        ),
                      ),
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
          );
        },
      ),
    );
  }
}
