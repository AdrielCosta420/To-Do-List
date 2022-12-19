import 'package:flutter/material.dart';

class CheckBoxListCustomWidget extends StatefulWidget {
  bool checkList = false;
  final title;

  CheckBoxListCustomWidget(
      {Key? key, required this.checkList, required this.title})
      : super(key: key);

  @override
  State<CheckBoxListCustomWidget> createState() =>
      _CheckBoxListCustomWidgetState();
}

class _CheckBoxListCustomWidgetState extends State<CheckBoxListCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CheckboxListTile(
        shape: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffbc4ed8)),
          borderRadius: BorderRadius.circular(21),
        ),
        side: const BorderSide(color: Colors.white, width: 0.5),
        checkColor: Colors.white,
        activeColor: Colors.green,
        checkboxShape: const CircleBorder(side: BorderSide(width: 0)),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        controlAffinity: ListTileControlAffinity.trailing,
        value: widget.checkList,
        onChanged: (bool? value) {
          setState(() {
            widget.checkList = value!;
          });
        },
      ),
    );
  }
}
