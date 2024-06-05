import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// import 'package:async/async.dart';
import 'dart:async';
import '../utils/iconAdapter.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget(
      {super.key,
      this.controlInfo,
      required this.inputData,
      required this.updateInputData,
      this.debounceTime = 500});

  final controlInfo;
  final inputData;
  final updateInputData;
  final debounceTime;
  final TextEditingController? controller = TextEditingController();
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
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('textfield:${widget.controlInfo["controlType"]}');

    return
        // Expanded(child:
        TextField(
      controller: widget.controller,
      onChanged: (value) {
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce = Timer(const Duration(milliseconds: 500), () {
          // print(value);
          // print(widget.controlInfo['id']);
          dynamic newData = {
            widget.controlInfo['id']: value,
          };
          // print(newData);
          widget.updateInputData(newData);
          // do something with query
        });
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: widget.controlInfo['placeholder'],
        label: Text(widget.controlInfo['caption']),
        prefixIcon: widget.controlInfo['startIcon'] != null
            ? Icon(
                getIconFromIconKey(widget.controlInfo['startIcon']['iconKey']))
            : null,
        suffixIcon: widget.controlInfo['endIcon'] != null
            ? Icon(getIconFromIconKey(widget.controlInfo['endIcon']['iconKey']))
            : null,
      ),
    );
    // );
  }
}
