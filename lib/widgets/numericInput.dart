import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  @override
  void initState() {
    super.initState();
    if (widget.controlInfo['value'] != null) {
      _controller.text = widget.controlInfo['value'].toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.controlInfo['showCaption'])
          Text(
            widget.controlInfo['caption'] ?? '',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: widget.controlInfo['placeholder'] ?? 'Enter value',
            errorText: widget.controlInfo['error'] ? 'Invalid value' : null,
            suffix: widget.controlInfo['showCounterIcon']
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          int currentValue =
                              int.tryParse(_controller.text) ?? 0;
                          int increment =
                              widget.controlInfo['incrementDecrementValue'] ??
                                  1;
                          setState(() {
                            _controller.text =
                                (currentValue + increment).toString();
                            widget.updateInputData(widget.controlInfo['id'],
                                {'value': _controller.text});
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          int currentValue =
                              int.tryParse(_controller.text) ?? 0;
                          int decrement =
                              widget.controlInfo['incrementDecrementValue'] ??
                                  1;
                          setState(() {
                            _controller.text =
                                (currentValue - decrement).toString();
                            widget.updateInputData(widget.controlInfo['id'],
                                {'value': _controller.text});
                          });
                        },
                      ),
                    ],
                  )
                : null,
          ),
          onChanged: (value) {
            widget.updateInputData(widget.controlInfo['id'], {'value': value});
          },
        ),
        if (widget.controlInfo['showHelpText'])
          Text(
            widget.controlInfo['helpText'] ?? '',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
      ],
    );
  }
}
