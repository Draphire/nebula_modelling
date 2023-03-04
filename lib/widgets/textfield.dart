import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key, this.controlInfo});

  final controlInfo;
  // final TextEditingController? controller;
  // final FocusNode? focusNode;
  // final TextInputType? keyboardType;
  // final TextInputAction? textInputAction;
  // final TextCapitalization? textCapitalization;
  // final TextStyle? style;
  // final StrutStyle? strutStyle;
  // final TextAlign? textAlign;
  // final TextAlignVertical? textAlignVertical;
  // final bool? autofocus;
  // final bool? obscureText;
  // final bool? autocorrect;
  // final bool? enableSuggestions;
  // final bool? readOnly;
  // final bool? showCursor;
  // final int? maxLines;
  // final int? minLines;
  // final int? maxLength;
  // final ValueChanged? onChanged;
  // final IconData? startIcon;
  // final IconData? endIcon;
  // final VoidCallback? onStartIconPressed;
  // final VoidCallback? onEndIconPressed;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    // print('textfield:${widget.controlInfo["controlType"]}');

    return
        // Expanded(child:
        TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: widget.controlInfo['placeholder'],
          label: Text(widget.controlInfo['caption'])),
    );
    // );
  }
}
