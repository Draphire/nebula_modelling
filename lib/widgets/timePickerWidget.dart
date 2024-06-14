import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:nebula_modelling/model/redux/app_state.dart';
import '../model/redux/viewModel/viewModel.dart';
import '../utils/utils.dart';

class TimePickerWidget extends StatefulWidget {
  final dynamic controlInfo;
  final inputData;
  final updateInputData;
  final debounceTime;

  const TimePickerWidget({
    Key? key,
    required this.controlInfo,
    required this.inputData,
    required this.updateInputData,
    this.debounceTime = 500,
  }) : super(key: key);

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  Future<void> _selectTime(BuildContext context, ViewModel viewModel) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        _controller.text = selectedTime.format(context);
        viewModel.updateComponent(
            widget.controlInfo['id'], {'value': _controller.text});
      });
    }
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
        String parsedValue = parseTemplateString(currentValue, viewModel);

        // Set the initial value of the TextEditingController
        _controller.text = currentValue.isNotEmpty ? parsedValue : defaultValue;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.controlInfo['caption'] != null)
              Text(
                parsedCaption,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 8), // Space between caption and TextField
            TextField(
              controller: _controller,
              readOnly: true,
              onTap: () => _selectTime(context, viewModel),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.access_time),
                labelText: widget.controlInfo['placeholder'] ?? 'Select Time',
                contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 12.0), // Adjust padding
              ),
            ),
          ],
        );
      },
    );
  }
}
