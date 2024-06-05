import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nebula_modelling/widgets/avatar.dart';
import 'package:nebula_modelling/widgets/button.dart';
import 'package:nebula_modelling/widgets/cardcontainer.dart';
import 'package:nebula_modelling/widgets/container.dart';
import 'package:nebula_modelling/widgets/icon.dart';
import 'package:nebula_modelling/widgets/label.dart';
import 'package:nebula_modelling/widgets/textfield.dart';

class ControlRenderer extends StatelessWidget {
  const ControlRenderer(
      {super.key,
      required this.controlInfo,
      required this.apiClient,
      required this.inputData,
      required this.updateInputData});
  final controlInfo;
  final apiClient;
  final inputData;
  final updateInputData;

  @override
  Widget build(BuildContext context) {
    // print('control:${controlInfo}');
    // print('control:${controlInfo["controlType"]}');
    switch (controlInfo['controlType']) {
      case 'avatar':
        return AvatarWidget(
          controlInfo: controlInfo,
          inputData: inputData,
          updateInputData: updateInputData,
        );
      case 'button':
        return ButtonWidget(
          controlInfo: controlInfo,
          inputData: inputData,
          updateInputData: updateInputData,
        );
      case 'cardcontainer':
        return CardContainerWidget(
          controlInfo: controlInfo,
          apiClient: apiClient,
          inputData: inputData,
          updateInputData: updateInputData,
        );
      case 'container':
        return ContainerWidget(
            controlInfo: controlInfo,
            apiClient: apiClient,
            inputData: inputData,
            updateInputData: updateInputData);
      case 'icon':
        return IconWidget(
          controlInfo: controlInfo,
        );
      case 'label':
        return LabelWidget(
          controlInfo: controlInfo,
        );
      case 'textfield':
        return TextFieldWidget(
          controlInfo: controlInfo,
          inputData: inputData,
          updateInputData: updateInputData,
        );
      default:
        return Text('${controlInfo["controlType"]} is not yet supported');
    }
  }
}
