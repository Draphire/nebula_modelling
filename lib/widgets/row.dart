import 'package:flutter/material.dart';
import '../renderer/control/control.dart';

class RowWidget extends StatelessWidget {
  final dynamic controlInfo;
  final dynamic apiClient;
  final dynamic inputData;
  final Function updateInputData;

  RowWidget({
    required this.controlInfo,
    required this.apiClient,
    required this.inputData,
    required this.updateInputData,
  });

  @override
  Widget build(BuildContext context) {
    final children = controlInfo['children']?.map<Widget>((child) {
          return Flexible(
            child: ControlRenderer(
              controlInfo: child,
              apiClient: apiClient,
              inputData: inputData,
              updateInputData: updateInputData,
            ),
          );
        }).toList() ??
        [];

    return Row(
      mainAxisAlignment: _getMainAxisAlignment(),
      crossAxisAlignment: _getCrossAxisAlignment(),
      children: children,
    );
  }

  MainAxisAlignment _getMainAxisAlignment() {
    String? alignItems = controlInfo['layout']['colLayout']['lg']['alignItems'];
    switch (alignItems) {
      case 'center':
        return MainAxisAlignment.center;
      case 'end':
        return MainAxisAlignment.end;
      case 'spaceBetween':
        return MainAxisAlignment.spaceBetween;
      case 'spaceAround':
        return MainAxisAlignment.spaceAround;
      case 'spaceEvenly':
        return MainAxisAlignment.spaceEvenly;
      default:
        return MainAxisAlignment.start;
    }
  }

  CrossAxisAlignment _getCrossAxisAlignment() {
    String? justifyContent =
        controlInfo['layout']['colLayout']['lg']['justifyContent'];
    switch (justifyContent) {
      case 'center':
        return CrossAxisAlignment.center;
      case 'end':
        return CrossAxisAlignment.end;
      case 'start':
        return CrossAxisAlignment.start;
      default:
        return CrossAxisAlignment.start;
    }
  }
}
