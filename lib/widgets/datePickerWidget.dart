import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nebula_modelling/utils/utils.dart';
import 'package:redux/redux.dart';
import 'package:nebula_modelling/model/redux/app_state.dart';
import '../model/redux/viewModel/viewModel.dart';

class DatePickerWidget extends StatefulWidget {
  final dynamic controlInfo;
  final inputData;
  final updateInputData;
  final debounceTime;

  const DatePickerWidget({
    Key? key,
    required this.controlInfo,
    required this.inputData,
    required this.updateInputData,
    this.debounceTime = 500,
  }) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedDate;
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  Future<void> _selectDate(BuildContext context, ViewModel viewModel) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _controller.text = "${selectedDate!.toLocal()}".split(' ')[0];
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
              onTap: () => _selectDate(context, viewModel),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
                labelText: widget.controlInfo['placeholder'] ?? 'Select Date',
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
