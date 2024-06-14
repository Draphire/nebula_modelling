import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nebula_modelling/model/redux/app_state.dart';
import 'package:nebula_modelling/model/redux/viewModel/viewModel.dart';
import 'package:nebula_modelling/utils/utils.dart';
import 'package:redux/redux.dart';

class NumericInputWidget extends StatefulWidget {
  final dynamic controlInfo;
  final dynamic inputData;
  final Function updateInputData;

  const NumericInputWidget({
    Key? key,
    required this.controlInfo,
    required this.inputData,
    required this.updateInputData,
  }) : super(key: key);

  @override
  _NumericInputWidgetState createState() => _NumericInputWidgetState();
}

class _NumericInputWidgetState extends State<NumericInputWidget> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    if (widget.controlInfo['value'] != null) {
      _controller.text = widget.controlInfo['value'].toString();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

        // Set the initial value of the TextEditingController
        _controller.text =
            currentValue.isNotEmpty ? currentValue : defaultValue;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.controlInfo['showCaption'])
              Text(
                parsedCaption,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 8), // Space between caption and TextField
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: widget.controlInfo['placeholder'] ?? 'Enter value',
                errorText: widget.controlInfo['error'] ? 'Invalid value' : null,
                contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 12.0), // Adjust padding
                suffixIcon: widget.controlInfo['showCounterIcon']
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              int currentValue =
                                  int.tryParse(_controller.text) ?? 0;
                              int increment = widget
                                      .controlInfo['incrementDecrementValue'] ??
                                  1;
                              setState(() {
                                _controller.text =
                                    (currentValue + increment).toString();
                                viewModel.updateComponent(
                                    widget.controlInfo['id'],
                                    {'value': _controller.text});
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              int currentValue =
                                  int.tryParse(_controller.text) ?? 0;
                              int decrement = widget
                                      .controlInfo['incrementDecrementValue'] ??
                                  1;
                              setState(() {
                                _controller.text =
                                    (currentValue - decrement).toString();
                                viewModel.updateComponent(
                                    widget.controlInfo['id'],
                                    {'value': _controller.text});
                              });
                            },
                          ),
                        ],
                      )
                    : null,
              ),
              onChanged: (value) {
                if (_debounce?.isActive ?? false) _debounce?.cancel();
                _debounce = Timer(Duration(milliseconds: 300), () {
                  viewModel.updateComponent(
                      widget.controlInfo['id'], {'value': value});
                });
              },
            ),
            if (widget.controlInfo['showHelpText'])
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  widget.controlInfo['helpText'] ?? '',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
