import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/app/modules/home/data/datasource/home_datasource_datasource_impl.dart';
import 'package:to_do_app/app/modules/tasks/ui/all_tasks_page.dart';
import 'package:to_do_app/app/modules/tasks/ui/in_progress_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final HomeDatasourceDatasourceImpl homedata = Modular.get();
  final controllerPage = PageController();
  final storageRef = FirebaseStorage.instance
      .ref("images")
      .child(FirebaseAuth.instance.currentUser!.uid);
  Uint8List? foto;

  bool allTaskSelected = true;
  bool inProgressSelected = false;

  Color colorTest = Colors.red;

  void changePage() {
    setState(() {
      allTaskSelected = !allTaskSelected;
      inProgressSelected = !inProgressSelected;
    });
  }

  @override
  void initState() {
    recuperarFoto();
    super.initState();
  }

  Future<void> recuperarFoto() async {
    var uint8list = await storageRef.getData();
    if (uint8list != null) {
      setState(() {
        foto = uint8list;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          backGroundInferior(context),
          Positioned(
              bottom: 0, right: 0, left: 0, child: backgrounSuperior(context)),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: GestureDetector(
                    onTap: () async {
                      ImagePicker imagePicker = ImagePicker();

                      final xfile = await imagePicker.pickImage(
                        source: ImageSource.gallery,
                      );

                      if (xfile != null) {
                        var readAsBytes = await xfile.readAsBytes();

                        setState(() {
                          foto = readAsBytes;
                        });

                        try {
                          await storageRef.putData(readAsBytes);
                        } on FirebaseException catch (e) {
                          print(e.code);
                        }
                      }
                    },
                    child: foto != null
                        ? Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: MemoryImage(foto!),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          )
                        : const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 13,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  if (!allTaskSelected) {
                                    changePage();
                                  }
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: allTaskSelected
                                        ? Colors.grey
                                        : Colors.white),
                                child: const Text(
                                  'All tasks',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  if (!inProgressSelected) {
                                    changePage();
                                  }
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: inProgressSelected
                                        ? Colors.grey
                                        : Colors.white),
                                child: const Text(
                                  'In progress',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: GestureDetector(
                            onPanUpdate: (details) {
                              int sensitivy = 8;
                              if (details.delta.dx > sensitivy) {
                                setState(() {
                                  colorTest = Colors.yellow;
                                });
                              }
                              if (details.delta.dx < -sensitivy) {
                                setState(() {
                                  colorTest = Colors.green;
                                });
                              }
                            },
                            child: PageView(
                              children: const [
                                AllTasksPage(),
                                InProgressPage(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget backGroundInferior(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    color: Colors.black,
  );
}

Widget backgrounSuperior(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height - 200,
    color: Colors.white,
  );
}

////////////////////////
///
///
/*
TextButton(
              onPressed: () {
                ImagePicker imagePicker = ImagePicker();
                imagePicker.pickImage(source: ImageSource.camera);
                print(imagePicker);
              },
              child: const Text('clique aqui'),
            ),
            ListTile(
              leading: CircleAvatar(
                child: IconButton(
                  onPressed: () async {
                    ImagePicker imagePicker = ImagePicker();
                    var Xfile = await imagePicker.pickImage(
                      source: ImageSource.gallery,
                    );

                    if (Xfile != null) {
                      var readAsBytes = await Xfile.readAsBytes();

                      setState(() {
                        foto = readAsBytes;
                      });
                    }
                  },
                  icon: const Icon(Icons.camera_alt_outlined),
                ),
              ),
            ),
            ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(100),
                child: Image.memory(
                  foto ?? Uint8List.fromList([]),
                ),
              ),












              floatingActionButton: FloatingActionButton(
        onPressed: () {
          homedata.logout();
          Modular.to.pushNamedAndRemoveUntil('/login', (p0) => false);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
            
            
            
            
            )
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            ////////////////////////////////////////////////////////////////////////
            ///
            ///
            ///
            
            
            
            
            
            
            
            
            
            
            
            Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: const Size(20, 130),
          child: CircleAvatar(
            backgroundColor: const Color(0xFF4682B4),
            radius: 50,
            child: GestureDetector(
              onTap: () async {
                ImagePicker imagePicker = ImagePicker();

                final Xfile = await imagePicker.pickImage(
                  source: ImageSource.gallery,
                );

                if (Xfile != null) {
                  var readAsBytes = await Xfile.readAsBytes();

                  setState(() {
                    foto = readAsBytes;
                  });

                  var storage = FirebaseStorage.instance;
                  final storageRef = storage
                      .ref("images")
                      .child(DateTime.now().microsecondsSinceEpoch.toString());
                  try {
                    await storageRef.putData(foto!);
                  } on FirebaseException catch (e) {
                    print(e.code);
                  }
                }
              },
              child: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adriel Costa',
              style: GoogleFonts.notoSansWarangCiti(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ],
        ),
      ),
    );
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            */
