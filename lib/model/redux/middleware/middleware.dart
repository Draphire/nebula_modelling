import 'package:nebula_modelling/model/redux/actions/actions.dart';
import 'package:redux/redux.dart';
import '../app_state.dart';

import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<Middleware<AppState>> appMiddleware() {
  return [
    TypedMiddleware<AppState, FetchDataAction>(_fetchData),
  ];
}

void _fetchData(
    Store<AppState> store, FetchDataAction action, NextDispatcher next) async {
  next(action);

  try {
    final response = await http.get(Uri.parse(action.apiEndpoint));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      store.dispatch(FetchDataSuccessAction(data));
      store.dispatch(ShowToastAction('Data fetched successfully!'));
      Future.delayed(Duration(seconds: 2), () {
        store.dispatch(HideToastAction());
      });
    } else {
      store.dispatch(FetchDataFailureAction('Failed to fetch data'));
    }
  } catch (e) {
    store.dispatch(FetchDataFailureAction(e.toString()));
  }
}
