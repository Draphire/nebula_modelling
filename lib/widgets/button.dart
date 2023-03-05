import 'package:flutter/material.dart';
import 'package:nebula_modelling/utils/iconAdapter.dart';

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

    List<Widget> buttonChildren = [];
    if (widget.controlInfo['startIcon'] != null) {
      buttonChildren.add(
          Icon(getIconFromIconKey(widget.controlInfo['startIcon']['iconKey'])));
    }
    if (widget.controlInfo['caption'] != null) {
      buttonChildren.add(Text(widget.controlInfo['caption']));
    }
    if (widget.controlInfo['endIcon'] != null) {
      buttonChildren.add(
          Icon(getIconFromIconKey(widget.controlInfo['endIcon']['iconKey'])));
    }

    return TextButton(
      onPressed: () {
        // Action to perform when button is pressed
      },
      style: TextButton.styleFrom(
        backgroundColor: Color.fromARGB(
            255, 237, 244, 250), // Set the background color of the button
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buttonChildren,
      ),
    );
  }
}
