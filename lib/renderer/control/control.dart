import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nebula_modelling/widgets/datePickerWidget.dart';
import 'package:nebula_modelling/widgets/numericInput.dart';
import 'package:nebula_modelling/widgets/timePickerWidget.dart';
import 'package:nebula_modelling/widgets/avatar.dart';
import 'package:nebula_modelling/widgets/button.dart';
import 'package:nebula_modelling/widgets/cardcontainer.dart';
import 'package:nebula_modelling/widgets/column.dart';
import 'package:nebula_modelling/widgets/container.dart';
import 'package:nebula_modelling/widgets/icon.dart';
import 'package:nebula_modelling/widgets/label.dart';
import 'package:nebula_modelling/widgets/row.dart';
import 'package:nebula_modelling/widgets/textFormField.dart';
import 'package:nebula_modelling/widgets/textfield.dart';

class ControlRenderer extends StatelessWidget {
  const ControlRenderer({
    super.key,
    required this.controlInfo,
    required this.apiClient,
    required this.inputData,
    required this.updateInputData,
  });

  final controlInfo;
  final apiClient;
  final inputData;
  final updateInputData;

  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (controlInfo['controlType']) {
      case 'avatar':
        child = AvatarWidget(
          controlInfo: controlInfo,
          inputData: inputData,
          updateInputData: updateInputData,
        );
        break;
      case 'button':
        child = ButtonWidget(
          controlInfo: controlInfo,
          inputData: inputData,
          updateInputData: updateInputData,
        );
        break;
      case 'cardcontainer':
        child = CardContainerWidget(
          controlInfo: controlInfo,
          apiClient: apiClient,
          inputData: inputData,
          updateInputData: updateInputData,
        );
        break;
      case 'container':
        child = ContainerWidget(
          controlInfo: controlInfo,
          apiClient: apiClient,
          inputData: inputData,
          updateInputData: updateInputData,
        );
        break;
      case 'icon':
        child = IconWidget(
          controlInfo: controlInfo,
        );
        break;
      case 'label':
        child = LabelWidget(
          controlInfo: controlInfo,
        );
        break;
      case 'textbox':
        child = TextFieldWidget(
          controlInfo: controlInfo,
          inputData: inputData,
          updateInputData: updateInputData,
        );
        break;
      case 'textarea':
        child = Expanded(
          child: TextFormFieldWidget(
            controlInfo: controlInfo,
            inputData: inputData,
            updateInputData: updateInputData,
          ),
        );
        break;
      case 'row':
        child = RowWidget(
          controlInfo: controlInfo,
          apiClient: apiClient,
          inputData: inputData,
          updateInputData: updateInputData,
        );
        break;
      case 'column':
        child = ColumnWidget(
          controlInfo: controlInfo,
          apiClient: apiClient,
          inputData: inputData,
          updateInputData: updateInputData,
        );
        break;
      case 'datePicker':
        child = DatePickerWidget(
          controlInfo: controlInfo,
          inputData: inputData,
          updateInputData: updateInputData,
        );
        break;
      case 'timePicker':
        child = TimePickerWidget(
          controlInfo: controlInfo,
          inputData: inputData,
          updateInputData: updateInputData,
        );
        break;
      case 'numeric':
        child = NumericInputWidget(
          controlInfo: controlInfo,
          inputData: inputData,
          updateInputData: updateInputData,
        );
        break;
      default:
        child = Text('${controlInfo["controlType"]} is not yet supported');
    }

    // Wrap the child widget in a Padding widget
    // return Padding(
    //   padding: const EdgeInsets.all(8.0), // Adjust the padding value as needed
    //   child: child,
    // );
    return child is Expanded
        ? child
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          );
  }
}
