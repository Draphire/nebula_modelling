import 'package:flutter/material.dart';
import 'package:nebula_modelling/utils/utils.dart';
import '../renderer/control/control.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

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
    if (controlInfo['children'] == null) {
      return Container();
    }
    final screenWidth = MediaQuery.of(context).size.width;
    final layout = applyLayout(controlInfo, screenWidth);

    final width = layout['width'];
    final height = layout['height'];

    // final children = controlInfo['children']?.map<BootstrapCol>((child) {
    //       return BootstrapCol(
    //         // Flexible(
    //         child: ControlRenderer(
    //           controlInfo: child,
    //           apiClient: apiClient,
    //           inputData: inputData,
    //           updateInputData: updateInputData,
    //         ),
    //       );
    //     }).toList() ??
    //     [];

    List<BootstrapCol> rowChildren = [];
    for (var child in controlInfo['children']) {
      rowChildren.add(
        BootstrapCol(
          sizes: 'col',
          child: ControlRenderer(
            controlInfo: child,
            apiClient: apiClient,
            inputData: inputData,
            updateInputData: updateInputData,
          ),
        ),
      );
    }

    return BootstrapRow(
      height: height, // Set the height here
      // mainAxisAlignment: _getMainAxisAlignment(),
      // crossAxisAlignment: _getCrossAxisAlignment(),
      children: rowChildren,
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
