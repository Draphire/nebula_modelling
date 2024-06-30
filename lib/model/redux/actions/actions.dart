import 'package:nebula_modelling/model/redux/app_state.dart';
import 'package:nebula_modelling/model/types/apiTypes.dart';

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

class OnEventAction {
  final String eventName;
  final dynamic options;
  // final String mode;
  // final String? appId;
  // final dynamic insertPageDetails;
  // final dynamic currentState;
  // final int? index;

  OnEventAction(this.eventName, this.options);
}

class AuthorizeApiClientAction {}

class AuthorizeApiClientSuccessAction {
  final String token;
  AuthorizeApiClientSuccessAction(this.token);
}

class AuthorizeApiClientFailureAction {
  final Exception error;
  AuthorizeApiClientFailureAction(this.error);
}

class UpdateApiClientAction {
  final ApiClient apiClient;

  UpdateApiClientAction(this.apiClient);
}

class AppStartAction {}

class RunQueryAction {
  final String queryId;
  final String queryName;
  final Map<String, dynamic> parameters;
  final Map<String, dynamic> event;

  RunQueryAction({
    required this.queryId,
    required this.queryName,
    required this.parameters,
    required this.event,
  });
}

class QueryResult {
  final String status;
  final dynamic data;
  final String? message;

  QueryResult({required this.status, this.data, this.message});
}

class UpdateQueryStateAction {
  final String queryName;
  final bool isLoading;
  final dynamic data;

  UpdateQueryStateAction(this.queryName, {this.isLoading = false, this.data});
}

// actions.dart
class UpdateTokenResponseAction {
  final dynamic? tokenResponse;

  UpdateTokenResponseAction(this.tokenResponse);
}
