import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:nebula_modelling/model/redux/app_state.dart';
import 'package:nebula_modelling/model/redux/viewModel/viewModel.dart';
import 'package:nebula_modelling/utils/utils.dart';

class ComboBoxWidget extends StatefulWidget {
  final dynamic controlInfo;

  const ComboBoxWidget({Key? key, required this.controlInfo}) : super(key: key);

  @override
  _ComboBoxWidgetState createState() => _ComboBoxWidgetState();
}

class _ComboBoxWidgetState extends State<ComboBoxWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      converter: (Store<AppState> store) => ViewModel.create(store),
      builder: (context, viewModel) {
        // Fetch options from the state using parseOptions
        String optionsTemplate = widget.controlInfo['options'];
        List<dynamic> options = parseOptions(optionsTemplate, viewModel);
        String valueField = widget.controlInfo['valueField'];
        String displayField = widget.controlInfo['displayField'];

        List<DropdownMenuItem<String>> dropdownItems = options.map((option) {
          return DropdownMenuItem<String>(
            value: option[valueField],
            child: Text(option[displayField]),
          );
        }).toList();

        // Parse the caption
        String captionTemplate = widget.controlInfo['caption'];
        String parsedCaption = parseTemplateString(captionTemplate, viewModel);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (parsedCaption.isNotEmpty)
              Text(
                parsedCaption,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            DropdownButton<String>(
              value: selectedValue,
              hint: Text(widget.controlInfo['placeholder'] ?? 'Select Value'),
              items: dropdownItems,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                  viewModel.updateComponent(
                      widget.controlInfo['id'], {'value': newValue});
                });
              },
              isExpanded: true,
            ),
          ],
        );
      },
    );
  }
}
