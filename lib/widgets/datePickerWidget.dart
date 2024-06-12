import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  final dynamic controlInfo;
  final dynamic inputData;
  final Function updateInputData;

  const DatePickerWidget({
    Key? key,
    required this.controlInfo,
    required this.inputData,
    required this.updateInputData,
  }) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedDate;
  final TextEditingController _controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
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
        widget.updateInputData(
            widget.controlInfo['id'], {'value': _controller.text});
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (selectedDate != null) {
      _controller.text = "${selectedDate!.toLocal()}".split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.controlInfo['caption'] != null)
          Text(
            widget.controlInfo['caption'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        TextField(
          controller: _controller,
          readOnly: true,
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.calendar_today),
            labelText: widget.controlInfo['placeholder'] ?? 'Select Date',
          ),
        ),
      ],
    );
  }
}
