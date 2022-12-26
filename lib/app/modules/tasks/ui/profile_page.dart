import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/app/modules/home/data/datasource/home_datasource_datasource_impl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final HomeDatasourceDatasourceImpl homedata = Modular.get();

  Uint8List? foto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  }
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
            )*/