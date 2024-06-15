// viewModel.dart
import 'package:nebula_modelling/model/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:nebula_modelling/model/redux/actions/actions.dart';

class ViewModel {
  final dynamic metadata;
  final dynamic apiClient;
  final CurrentState currentState;
  final Function(PageDetails) updatePageDetails;
  final Function(CurrentState) updateCurrentState;
  final Function(CurrentContext) updateCurrentContext;
  final Function(DataQueries) updateDataQueries;
  final Function(String, Map<String, dynamic>) updateComponent;
  final Function(String) fetchData;
  final Function(String) showDialog;
  final Function() hideDialog;
  final Function(String) showToast;
  final String? toastMessage;
  final Function() hideToast;

  ViewModel({
    required this.metadata,
    required this.apiClient,
    required this.currentState,
    required this.updatePageDetails,
    required this.updateCurrentState,
    required this.updateCurrentContext,
    required this.updateDataQueries,
    required this.updateComponent,
    required this.fetchData,
    required this.showDialog,
    required this.hideDialog,
    required this.showToast,
    required this.toastMessage,
    required this.hideToast,
  });

  factory ViewModel.create(Store<AppState> store) {
    // _showCustomDialog() {
    //   store.dispatch(ShowDialogAction());
    // }

    // _hideCustomDialog() {
    //   store.dispatch(HideDialogAction());
    // }

    _showToast(String message) {
      store.dispatch(ShowToastAction(message));
      Future.delayed(Duration(seconds: 3), () {
        store.dispatch(HideToastAction());
      });
    }

    return ViewModel(
      metadata: store.state.pageDetails.metaData,
      currentState: store.state.currentState,
      apiClient: store.state.apiClient,
      updatePageDetails: (PageDetails pageDetails) {
        store.dispatch(UpdatePageDetailsAction(pageDetails));
      },
      updateCurrentState: (CurrentState currentState) {
        store.dispatch(UpdateCurrentStateAction(currentState));
      },
      updateCurrentContext: (CurrentContext currentContext) {
        store.dispatch(UpdateCurrentContextAction(currentContext));
      },
      updateDataQueries: (DataQueries dataQueries) {
        store.dispatch(UpdateDataQueriesAction(dataQueries));
      },
      updateComponent: (String componentId, Map<String, dynamic> value) {
        store.dispatch(UpdateComponentAction(componentId, value));
      },
      fetchData: (String apiEndpoint) =>
          store.dispatch(FetchDataAction(apiEndpoint)),
      showDialog: (String message) {
        store.dispatch(ShowDialogAction(message));
      },
      hideDialog: () {
        store.dispatch(HideDialogAction());
      },
      showToast: _showToast,
      hideToast: () => store.dispatch(HideToastAction()),
      toastMessage: store.state.currentState.toastMessage,
    );
  }

  dynamic getValueFromPath(String path) {
    dynamic value = currentState.queries;
    List<String> keys = path.split('.');
    for (String key in keys) {
      if (value is Map<String, dynamic> && value.containsKey(key)) {
        value = value[key];
      } else if (value is List<dynamic>) {
        int? index = int.tryParse(key);
        if (index != null && index >= 0 && index < value.length) {
          value = value[index];
        } else {
          print('Index out of bounds or not a number: $key');
          return null;
        }
      } else {
        print('Key or index not found: $key');
        return null;
      }
    }
    print('Retrieved value: $value');
    return value;
  }
  // dynamic getValueFromPath(String path) {
  //   dynamic value = currentState.queries;
  //   List<String> keys = path.split('.');
  //   for (String key in keys) {
  //     if (value is Map<String, dynamic> && value.containsKey(key)) {
  //       value = value[key];
  //     } else {
  //       print('Key not found: $key');
  //       return null;
  //     }
  //   }
  //   print('Retrieved value: $value');
  //   return value;
  // }
}
