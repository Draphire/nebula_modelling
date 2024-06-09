// viewModel.dart
import 'package:nebula_modelling/model/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:nebula_modelling/model/redux/actions/actions.dart';

class ViewModel {
  final dynamic metadata;
  final dynamic apiClient;
  final Function(PageDetails) updatePageDetails;
  final Function(CurrentState) updateCurrentState;
  final Function(CurrentContext) updateCurrentContext;
  final Function(DataQueries) updateDataQueries;
  final Function(String, Map<String, dynamic>) updateComponent;

  ViewModel({
    required this.metadata,
    required this.apiClient,
    required this.updatePageDetails,
    required this.updateCurrentState,
    required this.updateCurrentContext,
    required this.updateDataQueries,
    required this.updateComponent,
  });

  factory ViewModel.create(Store<AppState> store) {
    return ViewModel(
      metadata: store.state.pageDetails.metaData,
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
    );
  }
}
