import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nebula_modelling/model/redux/app_state.dart';
import 'package:nebula_modelling/model/redux/viewModel/viewModel.dart';
import 'package:nebula_modelling/utils/utils.dart';
import 'package:redux/redux.dart';

class TimePickerWidget extends StatefulWidget {
  final dynamic controlInfo;
  final dynamic inputData;
  final Function updateInputData;

  const TimePickerWidget({
    Key? key,
    required this.controlInfo,
    required this.inputData,
    required this.updateInputData,
  }) : super(key: key);

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController _controller = TextEditingController();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        _controller.text = selectedTime.format(context);
        widget.updateInputData(
            widget.controlInfo['id'], {'value': selectedTime.format(context)});
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.text = selectedTime.format(context);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      converter: (Store<AppState> store) => ViewModel.create(store),
      builder: (context, viewModel) {
        // Parse the template string
        String captionTemplate = widget.controlInfo['caption'];
        String parsedCaption = parseTemplateString(captionTemplate, viewModel);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (parsedCaption != null)
              Text(
                parsedCaption,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            TextField(
              controller: _controller,
              readOnly: true,
              onTap: () => _selectTime(context),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.access_time),
                labelText: widget.controlInfo['placeholder'] ?? 'Select Time',
              ),
            ),
          ],
        );
      },
    );
  }
}
