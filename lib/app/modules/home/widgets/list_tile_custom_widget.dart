// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ListTileCustomWidget extends StatelessWidget {
  
  IconData icon;
  Color iconColor;
  String title;
  void Function()? onTap;

  ListTileCustomWidget({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: iconColor,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
