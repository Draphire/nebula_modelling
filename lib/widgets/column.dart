import 'package:flutter/material.dart';
import 'package:nebula_modelling/utils/utils.dart';
import '../renderer/control/control.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

class ColumnWidget extends StatelessWidget {
  final dynamic controlInfo;
  final dynamic apiClient;
  final dynamic inputData;
  final Function updateInputData;

  ColumnWidget({
    required this.controlInfo,
    required this.apiClient,
    required this.inputData,
    required this.updateInputData,
  });

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final layout = applyLayout(controlInfo, screenWidth);

    final layout = columnLayout(controlInfo['layout']);

    // final width = layout['width'];
    // final height = layout['height'];

    final children = controlInfo['children']
            ?.map<Widget>((child) => ControlRenderer(
                  controlInfo: child,
                  apiClient: apiClient,
                  inputData: inputData,
                  updateInputData: updateInputData,
                ))
            .toList() ??
        [];

    return BootstrapCol(
      sizes: layout ?? 'col-12',
      child:
          // SizedBox(
          //   height: height, // Set the height here
          //   child:
          Column(
        //   mainAxisAlignment: _getMainAxisAlignment(),
        //   crossAxisAlignment: _getCrossAxisAlignment(),
        children: children,
      ),
      // ),
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
