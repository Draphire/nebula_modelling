// reusable_dialog.dart

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nebula_modelling/model/redux/actions/actions.dart';
import 'package:nebula_modelling/model/redux/app_state.dart';
import 'package:redux/redux.dart';

class ReusableDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (Store<AppState> store) => store.state.currentState.showDialog,
      builder: (context, showDialog) {
        if (!showDialog) {
          return Container();
        }

        return AlertDialog(
          content: Text(StoreProvider.of<AppState>(context)
              .state
              .currentState
              .dialogMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                StoreProvider.of<AppState>(context)
                    .dispatch(HideDialogAction());
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
