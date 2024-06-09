import '../../services/apiClient.dart';
import '../types/apiTypes.dart';

//  class AppState {
//   final PageDetails pageDetails;
//   final CurrentState currentState;
//   final DataQueries dataQueries;
//   final CurrentContext currentContext;
//   final ApiClient apiClient;

//   AppState({
//     required this.pageDetails,
//     required this.currentState,
//     required this.dataQueries,
//     required this.currentContext,
//     required this.apiClient,
//   });

//   AppState.initialState()
//       : pageDetails = PageDetails.initialState(),
//         currentState = CurrentState.initialState(),
//         dataQueries = DataQueries.initialState(),
//         currentContext = CurrentContext.initialState(),
//         apiClient: HttpApiClient(baseUrl = "https://hrpsaasdev.ramcouat.com", headers = {
//         'Content-Type': 'application/json',
//         });
// }

class AppState {
  final PageDetails pageDetails;
  final CurrentState currentState;
  final DataQueries dataQueries;
  final CurrentContext currentContext;
  final ApiClient apiClient;

  AppState({
    required this.pageDetails,
    required this.currentState,
    required this.dataQueries,
    required this.currentContext,
    required this.apiClient,
  });

  factory AppState.initial() {
    return AppState(
      pageDetails: PageDetails.initialState(),
      currentState: CurrentState.initialState(),
      dataQueries: DataQueries.initialState(),
      currentContext: CurrentContext.initialState(),
      apiClient: HttpApiClient(
        baseUrl: 'https://your.api.base.url',
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  AppState copyWith({
    PageDetails? pageDetails,
    CurrentState? currentState,
    DataQueries? dataQueries,
    CurrentContext? currentContext,
    ApiClient? apiClient,
  }) {
    return AppState(
      pageDetails: pageDetails ?? this.pageDetails,
      currentState: currentState ?? this.currentState,
      dataQueries: dataQueries ?? this.dataQueries,
      currentContext: currentContext ?? this.currentContext,
      apiClient: apiClient ?? this.apiClient,
    );
  }
}

class PageDetails {
  final dynamic metaData;
  final String pageId;
  final dynamic layoutDetails;
  final String? modalPageId;
  final dynamic pagePrerequisiteVariables;

  PageDetails({
    required this.metaData,
    required this.pageId,
    required this.layoutDetails,
    this.modalPageId,
    this.pagePrerequisiteVariables,
  });

  PageDetails.initialState()
      : metaData = {
          "controlType": "container",
          "layout": {
            "colLayout": {
              "xl": 12,
              "lg": 12,
              "md": 12,
              "sm": 12,
              "xs": 12,
            }
          },
          "children": [
            {
              "controlType": "label",
              "caption": "User Management",
              "type": "h1",
              "layout": {
                "colLayout": {
                  "xl": 6,
                  "lg": 6,
                  "md": 6,
                  "sm": 8,
                  "xs": 8,
                },
                "spacing": {"mb": 2, "mt": 2}
              }
            },
            {
              "controlType": "button",
              "caption": "Add",
              "endIcon": {"controlType": "icon", "iconKey": "UseraddStroke"},
              "layout": {
                "colLayout": {
                  "xl": 12,
                  "lg": 12,
                  "md": 4,
                  "sm": 4,
                  "xs": 4,
                }
              }
            },
            {
              "controlType": "textfield",
              "caption": "Search",
              "placeholder": "Search user",
              "id": "search",
              // "endIcon": {"controlType": "icon", "iconKey": "Search"},
              "layout": {
                "colLayout": {
                  "xl": 12,
                  "lg": 12,
                  "md": 12,
                  "sm": 12,
                  "xs": 12,
                }
              }
            },
            {
              "controlType": "textfield",
              "caption": "Username",
              "placeholder": "username",
              "id": "Username",
              // "endIcon": {"controlType": "icon", "iconKey": "Search"},
              "layout": {
                "colLayout": {
                  "xl": 12,
                  "lg": 12,
                  "md": 12,
                  "sm": 12,
                  "xs": 12,
                }
              }
            },
            {
              "controlType": "textfield",
              "caption": "Userdescription",
              "placeholder": "User description",
              "id": "Userdescription",
              // "endIcon": {"controlType": "icon", "iconKey": "Search"},
              "layout": {
                "colLayout": {
                  "xl": 12,
                  "lg": 12,
                  "md": 12,
                  "sm": 12,
                  "xs": 12,
                }
              }
            },
            {
              "controlType": "textfield",
              "caption": "Email",
              "placeholder": "Email",
              "id": "Email",
              // "endIcon": {"controlType": "icon", "iconKey": "Search"},
              "layout": {
                "colLayout": {
                  "xl": 12,
                  "lg": 12,
                  "md": 12,
                  "sm": 12,
                  "xs": 12,
                }
              }
            },
            {
              "controlType": "button",
              "caption": "Add",
              "endIcon": {"controlType": "icon", "iconKey": "UseraddStroke"},
              "layout": {
                "colLayout": {
                  "xl": 12,
                  "lg": 12,
                  "md": 4,
                  "sm": 6,
                  "xs": 2,
                }
              }
            },
          ]
        },
        pageId = '',
        layoutDetails = null,
        modalPageId = null,
        pagePrerequisiteVariables = null;
}

class CurrentState {
  final Map<String, dynamic> queries;
  final Map<String, dynamic> components;
  final Map<String, dynamic> globals;
  final Map<String, dynamic> application;
  final Map<String, dynamic> errors;
  final Map<String, dynamic> variables;
  final Map<String, dynamic> client;
  final Map<String, dynamic> server;
  final Map<String, dynamic> page;
  final Map<String, dynamic> modal;
  final Map<String, dynamic> succeededQuery;
  final Map<String, dynamic> actions;

  CurrentState({
    required this.queries,
    required this.components,
    required this.globals,
    required this.application,
    required this.errors,
    required this.variables,
    required this.client,
    required this.server,
    required this.page,
    required this.modal,
    required this.succeededQuery,
    required this.actions,
  });

  CurrentState copyWith({
    Map<String, dynamic>? queries,
    Map<String, dynamic>? components,
    Map<String, dynamic>? globals,
    Map<String, dynamic>? application,
    Map<String, dynamic>? errors,
    Map<String, dynamic>? variables,
    Map<String, dynamic>? client,
    Map<String, dynamic>? server,
    Map<String, dynamic>? page,
    Map<String, dynamic>? modal,
    Map<String, dynamic>? succeededQuery,
    Map<String, dynamic>? actions,
  }) {
    return CurrentState(
      queries: queries ?? this.queries,
      components: components ?? this.components,
      globals: globals ?? this.globals,
      application: application ?? this.application,
      errors: errors ?? this.errors,
      variables: variables ?? this.variables,
      client: client ?? this.client,
      server: server ?? this.server,
      page: page ?? this.page,
      modal: modal ?? this.modal,
      succeededQuery: succeededQuery ?? this.succeededQuery,
      actions: actions ?? this.actions,
    );
  }

  CurrentState.initialState()
      : queries = {},
        components = {},
        globals = {
          'theme': {'name': 'light'},
          'urlparams': null
        },
        application = {'id': null, 'name': null, 'description': null},
        errors = {},
        variables = {},
        client = {},
        server = {},
        page = {'handle': '', 'variables': {}},
        modal = {'show': false, 'component': null},
        succeededQuery = {},
        actions = {};
}

class DataQueries {
  final List<dynamic> dataQueries;
  final bool loadingDataQueries;
  final bool isCreatingQueryInProcess;
  final bool isUpdatingQueryInProcess;
  final Map<String, dynamic> actions;

  DataQueries({
    required this.dataQueries,
    required this.loadingDataQueries,
    required this.isCreatingQueryInProcess,
    required this.isUpdatingQueryInProcess,
    required this.actions,
  });

  DataQueries.initialState()
      : dataQueries = [],
        loadingDataQueries = true,
        isCreatingQueryInProcess = false,
        isUpdatingQueryInProcess = false,
        actions = {};
}

class CurrentContext {
  final Map<String, dynamic> setOuData;
  final Map<String, dynamic> menuContext;
  final Map<String, dynamic> pageContext;
  final Map<String, dynamic> userContext;
  final Map<String, dynamic> settings;
  final Map<String, dynamic> authContext;
  final Map<String, dynamic> preferenceContext;
  final Map<String, dynamic> navData;
  final Map<String, dynamic> dialogInfo;
  final Map<String, dynamic> drawerInfo;
  final Map<String, dynamic> precisionContext;

  CurrentContext({
    required this.setOuData,
    required this.menuContext,
    required this.pageContext,
    required this.userContext,
    required this.settings,
    required this.authContext,
    required this.preferenceContext,
    required this.navData,
    required this.dialogInfo,
    required this.drawerInfo,
    required this.precisionContext,
  });

  CurrentContext.initialState()
      : setOuData = {},
        menuContext = {},
        pageContext = {},
        userContext = {},
        settings = {},
        authContext = {},
        preferenceContext = {},
        navData = {},
        dialogInfo = {},
        drawerInfo = {},
        precisionContext = {};
}
