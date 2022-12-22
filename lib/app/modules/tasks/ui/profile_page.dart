import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_app/app/modules/home/data/datasource/home_datasource_datasource_impl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final HomeDatasourceDatasourceImpl homedata = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Column(
          children: [
            FloatingActionButton(
              onPressed: () {
                homedata.logout();
                Modular.to.pushNamedAndRemoveUntil('/login', (p0) => false);
              },
            ),
          ],
        ));
  }
}
