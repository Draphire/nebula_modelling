import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:nebula_modelling/model/redux/app_state.dart';
import '../model/redux/viewModel/viewModel.dart';
import '../utils/iconAdapter.dart';
import '../utils/utils.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget(
      {super.key,
      this.controlInfo,
      required this.inputData,
      required this.updateInputData});

  final controlInfo;
  final inputData;
  final updateInputData;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      converter: (Store<AppState> store) => ViewModel.create(store),
      builder: (context, viewModel) {
        // Parse the template string for caption
        String captionTemplate = widget.controlInfo['caption'];
        String parsedCaption = parseTemplateString(captionTemplate, viewModel);

        List<Widget> buttonChildren = [];
        if (widget.controlInfo['startIcon'] != null) {
          buttonChildren.add(Icon(
            getIconFromIconKey(widget.controlInfo['startIcon']['iconKey']),
            color: Colors.black,
          ));
        }
        if (parsedCaption.isNotEmpty) {
          buttonChildren.add(Text(parsedCaption));
        }
        if (widget.controlInfo['endIcon'] != null) {
          buttonChildren.add(Icon(
            getIconFromIconKey(widget.controlInfo['endIcon']['iconKey']),
          ));
        }

        return ElevatedButton(
          onPressed: () {
            // Action to perform when button is pressed
            // Update the component state if needed
            viewModel.updateComponent(
                widget.controlInfo['id'], {'value': 'button_pressed'});

            viewModel.onEvent('onClick', widget.controlInfo['events']);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(88,
                36), // Set the minimum size to follow Material Design standards
            padding: EdgeInsets.symmetric(horizontal: 16), // Horizontal padding
            backgroundColor: Color.fromARGB(
                255, 194, 227, 255), // Set the background color of the button
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: buttonChildren,
          ),
        );
      },
    );
  }
}
