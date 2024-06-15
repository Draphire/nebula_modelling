// reusable_button.dart

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nebula_modelling/model/redux/app_state.dart';
import 'package:nebula_modelling/model/redux/viewModel/viewModel.dart';

class ReusableButton extends StatelessWidget {
  final String label;
  final String apiEndpoint;
  final String dialogMessage;
  final String toastMessage;

  ReusableButton({
    required this.label,
    required this.apiEndpoint,
    required this.dialogMessage,
    required this.toastMessage,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      converter: (store) => ViewModel.create(store),
      builder: (context, viewModel) {
        return ElevatedButton(
          onPressed: () {
            viewModel.fetchData(apiEndpoint);
            viewModel.showDialog(dialogMessage);
            // viewModel.showToast('This is a toast message')
            viewModel.showToast(toastMessage);
          },
          child: Text(label),
        );
      },
    );
  }
}
