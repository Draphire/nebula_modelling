import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key, this.controlInfo});

  final controlInfo;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    // print('button:${widget.controlInfo["controlType"]}');

    return TextButton(
        onPressed: () {}, child: Text(widget.controlInfo["caption"]));
  }
}
