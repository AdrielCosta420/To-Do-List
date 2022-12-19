import 'package:flutter/material.dart';

class TextFormFieldCustomWidget extends StatefulWidget {
  final hintText;
  final label;
  const TextFormFieldCustomWidget({Key? key, this.hintText, this.label})
      : super(key: key);

  @override
  State<TextFormFieldCustomWidget> createState() =>
      _TextFormFieldCustomWidgetState();
}

class _TextFormFieldCustomWidgetState extends State<TextFormFieldCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          counterStyle: const TextStyle(color: Colors.white),
          focusColor: Colors.yellow,
          focusedBorder: const OutlineInputBorder(
            gapPadding: 20,
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white70,
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.white30),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            gapPadding: 20,
            borderSide: BorderSide(color: Colors.white54),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
