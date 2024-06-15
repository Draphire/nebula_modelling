import 'package:nebula_modelling/model/redux/app_state.dart';

class UpdatePageDetailsAction {
  final PageDetails pageDetails;

  UpdatePageDetailsAction(this.pageDetails);
}

class UpdateCurrentStateAction {
  final CurrentState currentState;

  UpdateCurrentStateAction(this.currentState);
}

class UpdateCurrentContextAction {
  final CurrentContext currentContext;

  UpdateCurrentContextAction(this.currentContext);
}

class UpdateDataQueriesAction {
  final DataQueries dataQueries;

  UpdateDataQueriesAction(this.dataQueries);
}

class UpdateComponentAction {
  final String componentId;
  final Map<String, dynamic> value;

  UpdateComponentAction(this.componentId, this.value);
}

class FetchDataAction {
  final String apiEndpoint;

  FetchDataAction(this.apiEndpoint);
}

class FetchDataSuccessAction {
  final dynamic data;

  FetchDataSuccessAction(this.data);
}

class FetchDataFailureAction {
  final String error;

  FetchDataFailureAction(this.error);
}

class ShowDialogAction {
  final String message;

  ShowDialogAction(this.message);
}

class HideDialogAction {}

class ShowToastAction {
  final String message;

  ShowToastAction(this.message);
}

class HideToastAction {}
