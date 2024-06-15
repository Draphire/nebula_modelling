// reusable_toast.dart

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nebula_modelling/model/redux/app_state.dart';
import 'package:redux/redux.dart';

class ReusableToast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (Store<AppState> store) => store.state.currentState.showToast,
      builder: (context, showToast) {
        if (!showToast) {
          return Container();
        }

        return Positioned(
          bottom: 50.0,
          left: MediaQuery.of(context).size.width * 0.2,
          right: MediaQuery.of(context).size.width * 0.2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              // StoreProvider.of<AppState>(context)
              //     .state
              //     .currentState
              //     .toastMessage
              "",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
