import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:nebula_modelling/model/redux/app_state.dart';
import '../model/redux/viewModel/viewModel.dart';
import '../utils/iconAdapter.dart';
import '../utils/utils.dart';

class TextFormFieldWidget extends StatefulWidget {
  TextFormFieldWidget({
    Key? key,
    this.controlInfo,
    required this.inputData,
    required this.updateInputData,
    this.debounceTime = 500,
  }) : super(key: key);

  final controlInfo;
  final inputData;
  final updateInputData;
  final debounceTime;
  final TextEditingController? controller = TextEditingController();

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StoreConnector<AppState, ViewModel>(
      converter: (Store<AppState> store) => ViewModel.create(store),
      builder: (context, viewModel) {
        // Fetch the current value from the Redux state
        String componentId = widget.controlInfo['id'];
        String currentValue = '';
        if (viewModel.currentState.components.containsKey(componentId)) {
          currentValue =
              viewModel.currentState.components[componentId]['value'] ?? '';
        }
        String defaultValue = widget.controlInfo['defaultValue'] ?? '';

        // Parse the template string
        String captionTemplate = widget.controlInfo['caption'];
        String parsedCaption = parseTemplateString(captionTemplate, viewModel);
        String parsedValue = parseTemplateString(currentValue, viewModel);

        // Set the initial value of the TextEditingController
        widget.controller?.text =
            currentValue.isNotEmpty ? parsedValue : defaultValue;

        return Padding(
          padding: const EdgeInsets.all(3.0), // Add padding around the widget
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (parsedCaption.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    parsedCaption,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              Expanded(
                child: TextFormField(
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  controller: widget.controller,
                  onChanged: (value) {
                    if (_debounce?.isActive ?? false) _debounce?.cancel();
                    _debounce =
                        Timer(Duration(milliseconds: widget.debounceTime), () {
                      dynamic newData = {
                        widget.controlInfo['id']: value,
                      };
                      viewModel.updateComponent(
                          widget.controlInfo['id'], {'value': value});
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: widget.controlInfo['placeholder'],
                    labelText: parsedCaption,
                    prefixIcon: widget.controlInfo['startIcon'] != null
                        ? Icon(getIconFromIconKey(
                            widget.controlInfo['startIcon']['iconKey']))
                        : null,
                    suffixIcon: widget.controlInfo['endIcon'] != null
                        ? Icon(getIconFromIconKey(
                            widget.controlInfo['endIcon']['iconKey']))
                        : null,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
