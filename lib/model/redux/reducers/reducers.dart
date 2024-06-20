import '../app_state.dart';
import '../actions/actions.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is UpdateApiClientAction) {
    return AppState(
      pageDetails: pageDetailsReducer(state.pageDetails, action),
      currentState: currentStateReducer(state.currentState, action),
      dataQueries: dataQueriesReducer(state.dataQueries, action),
      currentContext: currentContextReducer(state.currentContext, action),
      apiClient: action.apiClient,
    );
  }

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
  if (action is ShowDialogAction) {
    return state.copyWith(
      showDialog: true,
      dialogMessage: action.message,
    );
  }
  if (action is HideDialogAction) {
    return state.copyWith(
      showDialog: false,
      dialogMessage: '',
    );
  }
  if (action is FetchDataSuccessAction) {
    return state.copyWith(
      showToast: false,
      dialogMessage: action.data.toString(),
    );
  }
  if (action is FetchDataFailureAction) {
    return state.copyWith(
      showToast: false,
      dialogMessage: action.error,
    );
  }
  if (action is ShowToastAction) {
    return state.copyWith(toastMessage: action.message);
  }
  if (action is HideToastAction) {
    return state.copyWith(toastMessage: null);
  }

  if (action is OnEventAction) {
    // Handle event actions
    return state.copyWith(
        // Update state based on action
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



// AppState _fetchDataSuccess(AppState state, FetchDataSuccessAction action) {
//   return state.copyWith(data: action.data, error: null);
// }

// AppState _fetchDataFailure(AppState state, FetchDataFailureAction action) {
//   return state.copyWith(error: action.error);
// }

// AppState _showDialog(AppState state, ShowDialogAction action) {
//   return state.copyWith(dialogMessage: action.message, showDialog: true);
// }

// AppState _hideDialog(AppState state, HideDialogAction action) {
//   return state.copyWith(dialogMessage: null, showDialog: false);
// }