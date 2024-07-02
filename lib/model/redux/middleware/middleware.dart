import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nebula_modelling/model/redux/actions/actions.dart';
import 'package:nebula_modelling/services/apiClient.dart';
import 'package:redux/redux.dart';
import '../app_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:graphql/client.dart' as graphql;
import 'package:nebula_modelling/utils/utils.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String _clientId = 'com.nebula.ramco.clients';
const String _authorizeEndpoint =
    'https://hrpsaasdev.ramcouat.com/coresecurityops/connect/authorize';
const String _tokenEndpoint =
    'https://hrpsaasdev.ramcouat.com/coresecurityops/connect/token';
const String _redirectUri = 'https://hrpsaasdev.ramcouat.com/app/saas';
const identifier = '1kxkbzzxuddqgtwtvovbw';
const _clientSecret =
    'KJkcK3DqZi6yNo8hdd1lUQsGtd0mbNN9zn0fBLI0wbVsSas6Yteif6Sp7yCoP13D';
// Middleware setup
List<Middleware<AppState>> appMiddleware() {
  return [
    TypedMiddleware<AppState, FetchDataAction>(_fetchData),
    TypedMiddleware<AppState, OnEventAction>(_onEvent),
    TypedMiddleware<AppState, AuthorizeApiClientAction>(
        authorizeApiClientMiddleware),
    TypedMiddleware<AppState, FetchPageMetadataAction>(pageMetadataMiddleware),
  ];
}

void pageMetadataMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) async {
  if (action is FetchPageMetadataAction) {
    try {
      final response = await http.post(
        Uri.parse('https://designer.ramco.com/api/1/page/metadata'),
        headers: {
          'Authorization': 'Bearer ${action.token}',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "appId": "62f02cb3-4f8c-410a-b7a4-43de97479833",
          "pageId": "9bfdf627-5df1-452f-b447-596f58387a0a",
          "getDataQueries": true,
        }),
      );

      if (response.statusCode == 200) {
        // final data = json.decode(response.body)['value'];
        final data = json.decode(response.body);
        // final pageMetadata = PageMetadata.fromJson(data);
        final pageMetadata = json.decode(data["value"]["pageMetadata"]);
        final dataQueries = data["value"]["dataQueries"]["dataQueries"];
        store
            .dispatch(FetchPageMetadataSuccessAction(pageMetadata["metadata"]));
        store.dispatch(FetchPageDataQueriesSuccessAction(dataQueries));
      } else {
        store.dispatch(
            FetchPageMetadataFailureAction('Failed to fetch page metadata'));
      }
    } catch (error) {
      store.dispatch(FetchPageMetadataFailureAction(error.toString()));
    }
  }

  next(action);
}

// Fetch data middleware
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

// Future<void> _onEvent(
//     Store<AppState> store, OnEventAction action, NextDispatcher next) async {
//   next(action);

//   final eventName = action.eventName;
//   final options = action.options;

//   if (eventName == "onPageLoad" || _isSupportedEvent(eventName)) {
//     final event = options['event'];
//     await executeActionsForEventId(store, eventName, event);
//   }
// }

// bool _isSupportedEvent(String eventName) {
//   const supportedEvents = [
//     "onDetect",
//     "onCheck",
//     "onUnCheck",
//     "onBoundsChange",
//     "onCreateMarker",
//     "onMarkerClick",
//     "onPageChanged",
//     "onSearch",
//     "onChange",
//     "onEnterPressed",
//     "onSelectionChange",
//     "onSelect",
//     "onClick",
//     "onHover",
//     "onDrop",
//     "onFileSelected",
//     "onFileLoaded",
//     "onFileDeselected",
//     "onStart",
//     "onResume",
//     "onReset",
//     "onPause",
//     "onCountDownFinish",
//     "onCalendarNavigate",
//     "onCalendarViewChange",
//     "onSearchTextChanged",
//     "onPageChange",
//     "onAddCardClick",
//     "onCardAdded",
//     "onCardRemoved",
//     "onCardMoved",
//     "onCardSelected",
//     "onCardUpdated",
//     "onUpdate",
//     "onTabSwitch",
//     "onFocus",
//     "onBlur",
//     "onOpen",
//     "onClose",
//     "onRowClicked",
//     "onRecordClicked",
//     "onCancelChanges",
//     "onSort",
//     "onCellValueChanged",
//     "onFilterChanged",
//     "onRowHovered",
//     "onSubmit",
//     "onInvalid",
//     "onNewRowsAdded",
//   ];

//   return supportedEvents.contains(eventName);
// }

// Future<void> executeActionsForEventId(
//   Store<AppState> store,
//   dynamic eventId,
//   dynamic events,
// ) async {
//   if (events.isEmpty) return;

//   for (final event in events) {
//     await executeActionWithDebounce(store, event["event"]);
//   await executeActionsForEventId(store, eventName, options);
//   }
// }

Future<void> _onEvent(
    Store<AppState> store, OnEventAction action, NextDispatcher next) async {
  next(action);
// Future<void> _handleEvents(Store<AppState> store, dynamic eventAction) async {
  // final _ref = action.ref;
  final eventName = action.eventName;
  final options = action.options;
  // final mode = eventAction.mode;
  // final appId = eventAction.appId;
  // final insertPageDetails = eventAction.insertPageDetails;
  // final currentState = eventAction.currentState;
  // final index = eventAction.index;
  // final customVariables = options.customVariables;

  if (eventName == "onPageLoad") {
    final event = options.event;
    await executeActionsForEventId(store, eventName, event
        // mode,
        // customVariables,
        // appId,
        // insertPageDetails,
        // currentState,
        // index,
        );
  }

  if ([
    "onDetect",
    "onCheck",
    "onUnCheck",
    "onBoundsChange",
    "onCreateMarker",
    "onMarkerClick",
    "onPageChanged",
    "onSearch",
    "onChange",
    "onEnterPressed",
    "onSelectionChange",
    "onSelect",
    "onClick",
    "onHover",
    "onDrop",
    "onFileSelected",
    "onFileLoaded",
    "onFileDeselected",
    "onStart",
    "onResume",
    "onReset",
    "onPause",
    "onCountDownFinish",
    "onCalendarNavigate",
    "onCalendarViewChange",
    "onSearchTextChanged",
    "onPageChange",
    "onAddCardClick",
    "onCardAdded",
    "onCardRemoved",
    "onCardMoved",
    "onCardSelected",
    "onCardUpdated",
    "onUpdate",
    "onTabSwitch",
    "onFocus",
    "onBlur",
    "onOpen",
    "onClose",
    "onRowClicked",
    "onRecordClicked",
    "onCancelChanges",
    "onSort",
    "onCellValueChanged",
    "onFilterChanged",
    "onRowHovered",
    "onSubmit",
    "onInvalid",
    "onNewRowsAdded",
  ].contains(eventName)) {
    // final event = options.event;
    await executeActionsForEventId(store, eventName, options
        // mode,
        // customVariables,
        // appId,
        // insertPageDetails,
        // currentState,
        // index,
        );
  }

  // Additional event handling logic can be added here
}

Future<void> executeActionsForEventId(
  Store<AppState> store,
  dynamic eventId,
  dynamic events,
  // dynamic mode,
  // dynamic customVariables,
  // dynamic appId,
  // dynamic insertPageDetails,
  // dynamic currentState,
  // int? index,
) async {
  if (events.isEmpty) return;

  // final filteredEvents = events
  //     .where((event) => event.eventId == eventId)
  //     .toList()
  //   ..sort((a, b) => a.index.compareTo(b.index));

  for (final event in events) {
    // if (events.length > 1) {
    //   event.events = events
    //       .where((e) => e.index > event.index && e.name == eventId)
    //       .toList();
    // }

    await executeActionWithDebounce(
      store,
      event["event"],
      // mode,
      // customVariables,
      // appId,
      // insertPageDetails,
      // currentState,
      // index,
    );

    // if (event.type == "dialog") {
    //   break;
    // }
  }
}

Future<void> executeActionWithDebounce(
  Store<AppState> store,
  dynamic event,
) async {
  if (event != null) {
    switch (event['actionId']) {
      case 'show-alert':
        Fluttertoast.showToast(
          msg: event["message"]!,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        break;

      case 'run-query':
        await _runQuery(store, event);
        break;

      case 'logout':
        break;

      case 'go-to-app':
        break;

      case 'show-modal':
        // Show modal implementation
        break;

      case 'close-modal':
        // Close modal implementation
        break;

      case 'copy-to-clipboard':
        break;

      case 'set-localstorage-value':
        break;

      case 'set-custom-variable':
        break;

      case 'unset-custom-variable':
        break;

      case 'set-page-variable':
        break;

      case 'unset-page-variable':
        break;

      case 'control-component':
        break;

      case 'switch-page':
        break;

      case 'generate-file':
        break;

      // Add other case actions here
    }
  }
}

void _handleResponse(Store<AppState> store, http.Response response,
    String queryName, Map<String, dynamic> options, String kind) {
  final statusCode = response.statusCode;

  if (statusCode >= 200 && statusCode < 300) {
    final data = jsonDecode(response.body);
    // store.dispatch(SetQueryAction(queryName, {
    //   'isLoading': false,
    //   'data': data,
    //   'rawData': response.body,
    //   'kind': kind,
    // }));
    // store.dispatch(SetSucceededQueryAction(queryName, {
    //   'type': 'query',
    //   'kind': kind,
    // }));
  } else {
    // store.dispatch(SetErrorAction(queryName, {
    //   'type': 'query',
    //   'kind': kind,
    //   'data': jsonDecode(response.body),
    //   'options': options,
    // }));
    // store.dispatch(SetQueryAction(queryName, {
    //   'isLoading': false,
    // }));
  }
}

Future<QueryResult> executeQuery(Store<AppState> store, dynamic query) async {
  final options = getQueryVariables(query?["options"], store.state);

  try {
    final response = await run(store, options, query["options"]);
    final promiseStatus = 'ok'; // Simplified for example

    _handleResponse(store, response, 'queryName', options, 'restapi');
    return QueryResult(status: promiseStatus, data: jsonDecode(response.body));
    //   if (promiseStatus == 'failed' || promiseStatus == 'Bad Request') {
    //     Provider.of<AppState>(context, listen: false).setErrors('queryName', response);
    //     Provider.of<AppState>(context, listen: false).setQueries('queryName', {
    //       'isLoading': false,
    //       // Additional response details if needed
    //     });
    //   } else {
    //     Provider.of<AppState>(context, listen: false).setQueries('queryName', {
    //       'isLoading': false,
    //       'data': response.body,
    //       'rawData': response.body,
    //       // Additional response details if needed
    //     });
    //     Provider.of<AppState>(context, listen: false).setSuccededQuery('queryName', {
    //       'type': 'query',
    //       'kind': 'restapi', // or 'graphql' based on the API
    //     });
    //   }
  } catch (e) {
    throw Exception("Execute query exception with error: $e");
    // Provider.of<AppState>(context, listen: false).setQueries('queryName', {
    //   'isLoading': false,
    // });
    // Handle error
  }

  if (query["kind"] == "graphql") {
    // return await executeGraphQLQuery(store, query);
  } else if (query["kind"] == "restApi") {
    // return await executeRestAPIQuery(store, query);
  } else {
    throw Exception("Unknown query kind");
  }
}

String extractOperationName(String query) {
  final RegExp operationRegex = RegExp(r'\{([\s\S]*?)\(');
  final match = operationRegex.firstMatch(query);
  return match != null ? match.group(1)?.trim() ?? '' : '';
}

Future<http.Response> run(Store<AppState> store, Map<String, dynamic> options,
    Map<String, dynamic> apiOptions) async {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  final body = jsonEncode({'options': options});
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json, text/plain, */*',
  };

  if (apiOptions['dataType'] == 1) {
    // Handle GraphQL queries
    final gqlQueries = apiOptions['gqlQueries'].toString();
    // .replaceAll(
    //   '00013303',
    //   store.state.currentContext.userContext ?? '',
    // );

    // final queryQueries = gqlQueries;
    // final queryData = jsonDecode(gqlQueries);

    final Map<String, dynamic> queryDataJson = jsonDecode(gqlQueries);
    final Map<String, dynamic> queryVariables =
        queryDataJson['variables'] ?? {};
    final String query = queryDataJson['query'] ?? '';
    final String operationName = extractOperationName(query);

    Map<String, dynamic> updatedParams = {};

    queryVariables.forEach((key, value) {
      //   if (operationName.isEmpty) {
      //     throw Exception("Operation name not found in the query.");
      //   }

      //   final valueType = getType(schema, operationName, key, query.contains("mutation"));

      //   if (value is! String) {
      //     updatedParams[key] = validateValueType(value, valueType);
      //     return;
      //   }

      //   dynamic parsedValue;
      //   if (value.contains("{{{") && value.contains("}}}")) {
      //     parsedValue = injectPrerequisiteVariables(value, currentState);
      //   } else if (value.contains("{{") && value.contains("}}")) {
      //     final extractedValue = extractTextFromStore(value);
      //     parsedValue = currentState['components'][extractedValue];
      //   } else {
      //     parsedValue = value;
      //   }

      //   updatedParams[key] = validateValueType(parsedValue ?? value, valueType);
    });

    final updatedgqlQueries = {
      ...queryDataJson,
      'variables': queryVariables,
    };

    final requestOptionsFromRuntime = {
      'method': 'POST',
      'headers': {
        'Authorization':
            'Bearer ${store.state.currentContext.authContext["access_token"]}',
        'Content-Type': 'application/json',
        'Context-Lang-Id':
            store.state.currentContext.userContext['langId'] ?? "1",
        'Context-Ou-Id': store.state.currentContext.userContext['ouId'] ?? "23",
        'Context-Role-Name':
            store.state.currentContext.userContext['roleName'] ?? "SUPVR",
      },
      'body': jsonEncode(updatedgqlQueries),
    };

    final response = await http.post(
      Uri.parse(apiOptions['url']),
      headers:
          Map<String, String>.from(requestOptionsFromRuntime['headers'] as Map),
      body: requestOptionsFromRuntime['body'],
    );

    if (response.statusCode == 200) {
      return response;
      // Handle successful response
    } else {
      // Handle error response
      throw Exception('Failed to make the request: ${response.body}');
    }
    // final variables = queryData['variables'] ?? {};
    // final operationName = queryData['operationName'];

    // final authToken = await _storage.read(key: 'accessToken');
    // final gqlHeaders = {
    //   'Authorization': 'Bearer ${store.state.apiClient.authToken}',
    //   'Content-Type': 'application/json',
    //   'Context-Lang-Id': store.state.currentContext.userContext?['langId'],
    //   'Context-Ou-Id': store.state.currentContext.userContext?['ouId'],
    //   'Context-Role-Name': store.state.currentContext.userContext?['roleName']
    //       ?['roleId'],
    // };

    // return executeGraphQLQuery(store, options, query, variables, gqlHeaders);
  } else {
    // Handle REST API calls
    final requestOptions = {
      'method': apiOptions['method'],
      'headers': headers,
      'body': body,
    };

    final url = apiOptions['url'];

    switch (apiOptions['method']) {
      case 'GET':
        return http.get(Uri.parse(url), headers: headers);
      case 'POST':
        return http.post(Uri.parse(url), headers: headers, body: body);
      default:
        return http.post(Uri.parse(url), headers: headers, body: body);
    }
  }
}

//   Future<http.Response> _executeGraphQLQuery(String url, String query, Map<String, dynamic> variables, Map<String, String> headers) async {
//   final Link link = HttpLink(url, defaultHeaders: headers);

//   final GraphQLClient client = GraphQLClient(
//     cache: GraphQLCache(store: InMemoryStore()),
//     link: link,
//   );

//   final QueryOptions options = QueryOptions(
//     document: gql(query),
//     variables: variables,
//   );

//   final result = await client.query(options);

//   if (result.hasException) {
//     throw Exception(result.exception.toString());
//   }

//   return http.Response(jsonEncode(result.data), 200);
// }

// Future<http.Response> _executeGraphQLQuery(String url, String query, Map<String, dynamic> variables, Map<String, String> headers) async {
//   final Link link = HttpLink(url, defaultHeaders: headers);

//   final GraphQLClient client = GraphQLClient(
//     cache: GraphQLCache(store: InMemoryStore()),
//     link: link,
//   );

//   final QueryOptions options = QueryOptions(
//     document: gql(query),
//     variables: variables,
//   );

//   final result = await client.query(options);

//   if (result.hasException) {
//     throw Exception(result.exception.toString());
//   }

//   return http.Response(jsonEncode(result.data), 200);
// }

Future<http.Response> executeGraphQLQuery(
    Store<AppState> store,
    dynamic options,
    dynamic query,
    Map<String, dynamic> variables,
    Map<String, dynamic> headers) async {
  final httpLink = graphql.HttpLink(
    query.options['url'],
    defaultHeaders: {
      ...query.options['gqlHeaders'],
      'Authorization': 'Bearer ${store.state.apiClient.authToken}',
    },
  );

  final graphql.GraphQLClient client = graphql.GraphQLClient(
    cache: graphql.GraphQLCache(),
    link: httpLink,
  );

  final gqlQuery = graphql.gql(query.options['gqlQueries']);

  final gqlOptions = graphql.QueryOptions(
    document: gqlQuery,
    variables: options,
  );
  try {
    final result = await client.query(gqlOptions);

    if (result.hasException) {
      store.dispatch(FetchDataFailureAction(result.exception.toString()));
    } else {
      store.dispatch(FetchDataSuccessAction(result.data));
      store.dispatch(ShowToastAction('Query executed successfully!'));
      Future.delayed(Duration(seconds: 2), () {
        store.dispatch(HideToastAction());
      });
    }
  } catch (e) {
    store.dispatch(FetchDataFailureAction(e.toString()));
  }
  throw Exception("Failed to execute query");
}

Future<QueryResult> executeRestAPIQuery(
    dynamic query, Map<String, dynamic> parameters) async {
  final uri = Uri.parse('https://yourapi.com/${query["endpoint"]}');
  final response =
      await http.post(uri, body: json.encode(parameters), headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
  });

  if (response.statusCode == 200) {
    return QueryResult(status: "ok", data: json.decode(response.body));
  } else {
    return QueryResult(
        status: "failed", message: response.reasonPhrase ?? "Unknown error");
  }
}

Future<void> _runQuery(Store<AppState> store, dynamic event) async {
  // Fetch query details from the state
  final query = store.state.dataQueries.dataQueries
      .firstWhere((q) => q["id"] == event['queryId'], orElse: () => null);

  if (query != null) {
    try {
      // Update state to show loading
      store.dispatch(UpdateQueryStateAction(query['name'], isLoading: true));
      store.dispatch(ShowToastAction(
          'query name ' + query['name'] + ' is being executed...'));

      final result = await executeQuery(store, query);

      //   if (result.status == "failed") {
      //     store.dispatch(FetchDataFailureAction(result.message));
      //     store.dispatch(UpdateQueryStateAction(query['name'], isLoading: false));
      //   } else {
      //     store.dispatch(FetchDataSuccessAction(result.data));
      //     store.dispatch(UpdateQueryStateAction(query['name'], isLoading: false, data: result.data));
      //     store.dispatch(ShowToastAction('Query executed successfully!'));
      //     Future.delayed(Duration(seconds: 2), () {
      //       store.dispatch(HideToastAction());
      //     });
      //   }
    } catch (e) {
      store.dispatch(FetchDataFailureAction(e.toString()));
      store.dispatch(UpdateQueryStateAction(query['name'], isLoading: false));
    }
  } else {
    store.dispatch(FetchDataFailureAction("Query not found"));
    return;
  }

  // final String query = event['queryName'];
  // const String query =
  //     'query leaveReason { fetchLeaveReason( leavetypeCode: "{{ID1715522021427336.comboValue}}" includeInactive: true) { leavereasonCode  leavereasonDesc  }}';
  // final Map<String, dynamic> variables = event['inputParams'];

  // final graphql.HttpLink httpLink = graphql.HttpLink(
  //   'https://designer.ramcouat.com/coregwopsPayce/ucgsgql/',
  //   defaultHeaders: {
  //     'Accept': '*/*',
  //     'Accept-Encoding': 'gzip, deflate, br, zstd',
  //     'Accept-Language': 'en-GB,en-US;q=0.9,en;q=0.8',
  //     'Authorization':
  //         'Bearer C6D527F5057D3933055719C68B58A460DF43B0D5421EBD17D96EDE81FF24F50F',
  //     'Content-Type': 'application/json',
  //     'Context-Lang-Id': '1',
  //     'Context-Ou-Id': '23',
  //     'Context-Role-Name': 'SUPVR',
  //     'Origin': 'http://localhost:3001',
  //     'Priority': 'u=1, i',
  //   },
  // );

  // final graphql.GraphQLClient client = graphql.GraphQLClient(
  //   cache: graphql.GraphQLCache(),
  //   link: httpLink,
  // );

  // final graphql.MutationOptions options = graphql.MutationOptions(
  //   document: graphql.gql(query),
  //   variables: variables,
  // );

  // try {
  //   final graphql.QueryResult result = await client.mutate(options);

  //   if (result.hasException) {
  //     store.dispatch(FetchDataFailureAction(result.exception.toString()));
  //   } else {
  //     store.dispatch(FetchDataSuccessAction(result.data));
  //     store.dispatch(ShowToastAction('Query executed successfully!'));
  //     Future.delayed(Duration(seconds: 2), () {
  //       store.dispatch(HideToastAction());
  //     });
  //   }
  // } catch (e) {
  //   store.dispatch(FetchDataFailureAction(e.toString()));
  // }
}

void authorizeApiClientMiddleware(Store<AppState> store,
    AuthorizeApiClientAction action, NextDispatcher next) async {
  // if (action is AppStartAction) {
  // Define and dispatch AppStartAction at app startup
  final apiClient = store.state.apiClient;

  try {
    final token = await apiClient.authClientCredentials(
      // Call the authClientCredentials method
      authorizationEndpoint: _tokenEndpoint,
      identifier: identifier,
      clientSecret: _clientSecret,
    );
    apiClient.authToken = token;
    store.dispatch(UpdateApiClientAction(apiClient));
  } catch (e) {
    print('Authorization failed: $e');
  }
  // }

  next(action);
}


// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:nebula_modelling/model/redux/actions/actions.dart';
// import 'package:redux/redux.dart';
// import '../app_state.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';

// // Middleware setup
// List<Middleware<AppState>> appMiddleware() {
//   return [
//     TypedMiddleware<AppState, FetchDataAction>(_fetchData),
//     TypedMiddleware<AppState, OnEventAction>(
//         _onEvent), // Adding onEvent middleware
//   ];
// }

// // Fetch data middleware
// void _fetchData(
//     Store<AppState> store, FetchDataAction action, NextDispatcher next) async {
//   next(action);

//   try {
//     final response = await http.get(Uri.parse(action.apiEndpoint));
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       store.dispatch(FetchDataSuccessAction(data));
//       store.dispatch(ShowToastAction('Data fetched successfully!'));
//       Future.delayed(Duration(seconds: 2), () {
//         store.dispatch(HideToastAction());
//       });
//     } else {
//       store.dispatch(FetchDataFailureAction('Failed to fetch data'));
//     }
//   } catch (e) {
//     store.dispatch(FetchDataFailureAction(e.toString()));
//   }
// }

// Future<void> _onEvent(
//     Store<AppState> store, OnEventAction action, NextDispatcher next) async {
//   next(action);
// // Future<void> _handleEvents(Store<AppState> store, dynamic eventAction) async {
//   // final _ref = action.ref;
//   final eventName = action.eventName;
//   final options = action.options;
//   // final mode = eventAction.mode;
//   // final appId = eventAction.appId;
//   // final insertPageDetails = eventAction.insertPageDetails;
//   // final currentState = eventAction.currentState;
//   // final index = eventAction.index;
//   // final customVariables = options.customVariables;

//   if (eventName == "onPageLoad") {
//     final event = options.event;
//     await executeActionsForEventId(store, eventName, event
//         // mode,
//         // customVariables,
//         // appId,
//         // insertPageDetails,
//         // currentState,
//         // index,
//         );
//   }

//   if ([
//     "onDetect",
//     "onCheck",
//     "onUnCheck",
//     "onBoundsChange",
//     "onCreateMarker",
//     "onMarkerClick",
//     "onPageChanged",
//     "onSearch",
//     "onChange",
//     "onEnterPressed",
//     "onSelectionChange",
//     "onSelect",
//     "onClick",
//     "onHover",
//     "onDrop",
//     "onFileSelected",
//     "onFileLoaded",
//     "onFileDeselected",
//     "onStart",
//     "onResume",
//     "onReset",
//     "onPause",
//     "onCountDownFinish",
//     "onCalendarNavigate",
//     "onCalendarViewChange",
//     "onSearchTextChanged",
//     "onPageChange",
//     "onAddCardClick",
//     "onCardAdded",
//     "onCardRemoved",
//     "onCardMoved",
//     "onCardSelected",
//     "onCardUpdated",
//     "onUpdate",
//     "onTabSwitch",
//     "onFocus",
//     "onBlur",
//     "onOpen",
//     "onClose",
//     "onRowClicked",
//     "onRecordClicked",
//     "onCancelChanges",
//     "onSort",
//     "onCellValueChanged",
//     "onFilterChanged",
//     "onRowHovered",
//     "onSubmit",
//     "onInvalid",
//     "onNewRowsAdded",
//   ].contains(eventName)) {
//     // final event = options.event;
//     await executeActionsForEventId(store, eventName, options
//         // mode,
//         // customVariables,
//         // appId,
//         // insertPageDetails,
//         // currentState,
//         // index,
//         );
//   }

//   // Additional event handling logic can be added here
// }

// Future<void> executeActionsForEventId(
//   Store<AppState> store,
//   dynamic eventId,
//   dynamic events,
//   // dynamic mode,
//   // dynamic customVariables,
//   // dynamic appId,
//   // dynamic insertPageDetails,
//   // dynamic currentState,
//   // int? index,
// ) async {
//   if (events.isEmpty) return;

//   // final filteredEvents = events
//   //     .where((event) => event.eventId == eventId)
//   //     .toList()
//   //   ..sort((a, b) => a.index.compareTo(b.index));

//   for (final event in events) {
//     // if (events.length > 1) {
//     //   event.events = events
//     //       .where((e) => e.index > event.index && e.name == eventId)
//     //       .toList();
//     // }

//     await executeActionWithDebounce(
//       store,
//       event["event"],
//       // mode,
//       // customVariables,
//       // appId,
//       // insertPageDetails,
//       // currentState,
//       // index,
//     );

//     // if (event.type == "dialog") {
//     //   break;
//     // }
//   }
// }

// Future<void> executeAction(dynamic store, dynamic options) async {
//   final debounceTimer =
//       Timer(Duration(milliseconds: options.debounce ?? 300), () {
//     executeActionWithDebounce(
//       store,
//       options.event,
//       // mode,
//       // customVariables,
//       // appId,
//       // insertPageDetails,
//       // currentState,
//       // index,
//     );
//   });

//   // Clear the timer if needed
//   debounceTimer.cancel();
// }

// Future<void> executeActionWithDebounce(
//   dynamic store,
//   dynamic event,
//   // dynamic mode,
//   // dynamic customVariables,
//   // dynamic appId,
//   // dynamic insertPageDetails,
//   // dynamic currentState,
//   // int index,
// ) async {
//   if (event != null) {
//     // if (event['runOnlyIf'] != null) {
//     //   final shouldRun = resolveReferences(
//     //     event['runOnlyIf'],
//     //     getCurrentState(),
//     //     null,
//     //     customVariables,
//     //   );
//     //   if (!shouldRun) {
//     //     return;
//     //   }
//     // }

//     switch (event['actionId']) {
//       case 'show-alert':
//         Fluttertoast.showToast(
//           msg: event["message"]!,
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.black,
//           textColor: Colors.white,
//           fontSize: 16.0,
//         );
//         // store.dispatch(ShowToastAction(event["message"]));
//         // Future.delayed(Duration(seconds: 2), () {
//         //   store.dispatch(HideToastAction());
//         // });
//         break;

//       case 'show-dialog':
//         // if (event['type'] == 'dialog') {
//         //   // Show dialog implementation
//         // } else {
//         //   final response = await GetPageDetails(appId: appId, pageId: event['pageId'], getDataQueries: true);
//         //   if (response != null && response['value'] != null && response['value']['pageMetadata'] != null) {
//         //     final childMetadata = jsonDecode(response['value']['pageMetadata'])['metadata'];
//         //     final sidedrawMetadata = updateSidedrawChildren(childMetadata, event);
//         //     final prerequisitesObj = {};

//         //     if (response['value']['pagePrequisites'] != null) {
//         //       final pagePrerequisitesArr = response['value']['pagePrequisites'].split(',');
//         //       for (var preReq in pagePrerequisitesArr) {
//         //         prerequisitesObj[preReq] = getExposedVariableValues(event[preReq], currentState, index);
//         //       }
//         //     }

//         //     insertPageDetails(sidedrawMetadata, event['pageId'], response['value']['dataQueries'], prerequisitesObj);
//         //   }
//         // }
//         break;

//       case 'run-query':
//         break;

//       case 'logout':
//         break;

//       case 'go-to-app':
//         break;

//       case 'show-modal':
//         // Show modal implementation
//         break;

//       case 'close-modal':
//         // Close modal implementation
//         break;

//       case 'copy-to-clipboard':
//         break;

//       case 'set-localstorage-value':
//         break;

//       case 'set-custom-variable':
//         break;

//       case 'unset-custom-variable':
//         break;

//       case 'set-page-variable':
//         break;

//       case 'unset-page-variable':
//         break;

//       case 'control-component':
//         break;

//       case 'switch-page':
//         break;

//       case 'generate-file':
//         break;

//       // Add other case actions here
//     }
//   }
// }
// // // onEvent middleware
// // void _onEvent(Store<AppState> store, EventAction action, NextDispatcher next) {
// //   next(action);

// //   // Handle the event
// //   switch (action.eventType) {
// //     case EventType.FetchData:
// //       store.dispatch(FetchDataAction(action.apiEndpoint));
// //       break;
// //     case EventType.ShowToast:
// //       store.dispatch(ShowToastAction(action.message));
// //       Future.delayed(Duration(seconds: 2), () {
// //         store.dispatch(HideToastAction());
// //       });
// //       break;
// //     case EventType.HideToast:
// //       store.dispatch(HideToastAction());
// //       break;
// //     default:
// //       break;
// //   }
// // }

// // EventAction class
// // class EventAction {
// //   final EventType eventType;
// //   final String apiEndpoint;
// //   final String message;

// //   EventAction(
// //       {required this.eventType, this.apiEndpoint = '', this.message = ''});
// // }

// // // EventType enum
// // // ignore: constant_identifier_names
// // enum EventType { FetchData, ShowToast, HideToast }
