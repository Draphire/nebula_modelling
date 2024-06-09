import '../app_state.dart';
import '../actions/actions.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    pageDetails: pageDetailsReducer(state.pageDetails, action),
    currentState: currentStateReducer(state.currentState, action),
    dataQueries: dataQueriesReducer(state.dataQueries, action),
    currentContext: currentContextReducer(state.currentContext, action),
    apiClient: state.apiClient,
  );
}

PageDetails pageDetailsReducer(PageDetails state, dynamic action) {
  if (action is UpdatePageDetailsAction) {
    return action.pageDetails;
  }
  return state;
}

CurrentState currentStateReducer(CurrentState state, dynamic action) {
  if (action is UpdateCurrentStateAction) {
    return action.currentState;
  }
  if (action is UpdateComponentAction) {
    return state.copyWith(
      components: {
        ...state.components,
        action.componentId: action.value,
      },
    );
  }
  return state;
}

DataQueries dataQueriesReducer(DataQueries state, dynamic action) {
  if (action is UpdateDataQueriesAction) {
    return action.dataQueries;
  }
  return state;
}

CurrentContext currentContextReducer(CurrentContext state, dynamic action) {
  if (action is UpdateCurrentContextAction) {
    return action.currentContext;
  }
  return state;
}
