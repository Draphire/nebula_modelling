import 'package:flutter/material.dart';
import 'package:nebula_modelling/utils/utils.dart';
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
    final List<Widget> children =
        (controlInfo['children']?.map<Widget>((child) {
                  return Expanded(
                    child: ControlRenderer(
                      controlInfo: child,
                      apiClient: apiClient,
                      inputData: inputData,
                      updateInputData: updateInputData,
                    ),
                  );
                }).toList() ??
                <Widget>[])
            .cast<Widget>();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final layout = applyLayout(controlInfo, screenWidth, screenHeight);
    final double maxHeight = layout['height']! / 2; // Your desired height

    return Container(
      width: screenWidth,
      constraints: BoxConstraints(
        minHeight: maxHeight,
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: _getMainAxisAlignment(),
          crossAxisAlignment: _getCrossAxisAlignment(),
          children: children,
        ),
      ),
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
