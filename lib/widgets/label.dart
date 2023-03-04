import "package:flutter/material.dart";

import "../utils/layoutUtils.dart";

class LabelWidget extends StatefulWidget {
  const LabelWidget({super.key, required this.controlInfo});
  final controlInfo;

  @override
  State<LabelWidget> createState() => _LabelWidgetState();
}

class _LabelWidgetState extends State<LabelWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.controlInfo['caption'] ?? "",
      style: getTextStyle(widget.controlInfo),
    );
  }
}
