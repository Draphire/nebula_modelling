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
          "containerType": "fluid",
          "styles": {"backgroundColor": ""},
          "id": "ID1713440892954",
          "layout": {
            "colLayout": {
              "lg": {"col": "12", "height": "200"}
            }
          },
          "children": [
            {
              "controlType": "container",
              "styles": {"backgroundColor": ""},
              "layout": {
                "colLayout": {
                  "lg": {"col": "12", "height": "200"}
                }
              },
              "children": [
                {
                  "caption":
                      "{{testadithi.data.data.fetchBackupEmp.0.backupEmployeeName}}",
                  "controlType": "textfield",
                  "hideCaption": false,
                  "layout": {
                    "colLayout": {
                      "lg": {"col": 2, "height": "200"}
                    }
                  },
                  "size": "small",
                  "mandatory": false,
                  "variant": "Standard",
                  "value": "Hello",
                  "disabled": false,
                  "visibility": true,
                  "isReadonly": false,
                  "uiTask": false,
                  "enableInheritWidth": false,
                  "isRVW": false,
                  "error": false,
                  "success": false,
                  "id": "ID1713519951416271",
                  "isDragging": false,
                  "selectedComponentId": "",
                  "componentDropped": [],
                  "index": 0,
                  "events": [
                    {
                      "event": {
                        "eventId": "onChange",
                        "actionId": "show-alert",
                        "message": "Hello",
                        "alertType": "warning"
                      },
                      "target": "component",
                      "sourceId": "ID1713519951416271",
                      "index": 0,
                      "pageId": "2bf8a371-9207-4b9c-bac2-d30a05fbd6ad",
                      "appId": "3180d666-cf1c-4f54-9410-13a820917fe4",
                      "name": "onChange"
                    }
                  ]
                },
                {
                  "caption": "Submit",
                  "controlType": "button",
                  "hideCaption": false,
                  "layout": {
                    "colLayout": {
                      "lg": {"col": 2, "height": "200"}
                    }
                  },
                  "disabled": false,
                  "visibility": true,
                  "variant": "contained",
                  "size": "xsmall",
                  "color": "primary",
                  "tooltip": "Tooltip",
                  "id": "ID171351995652011",
                  "isDragging": false,
                  "selectedComponentId": "",
                  "componentDropped": [],
                  "index": 1,
                  "events": [
                    {
                      "event": {
                        "eventId": "onClick",
                        "actionId": "switch-page",
                        "pageId": "5fbbbaad-a04b-47bb-9d41-16b06fa99a46"
                      },
                      "target": "component",
                      "sourceId": "ID171351995652011",
                      "index": 0,
                      "pageId": "2bf8a371-9207-4b9c-bac2-d30a05fbd6ad",
                      "appId": "3180d666-cf1c-4f54-9410-13a820917fe4",
                      "name": "onClick"
                    },
                    {
                      "event": {
                        "eventId": "onClick",
                        "actionId": "show-alert",
                        "message": "Hello",
                        "alertType": "warning"
                      },
                      "target": "component",
                      "sourceId": "ID171351995652011",
                      "index": 1,
                      "pageId": "2bf8a371-9207-4b9c-bac2-d30a05fbd6ad",
                      "appId": "3180d666-cf1c-4f54-9410-13a820917fe4",
                      "name": "onClick"
                    }
                  ]
                }
              ],
              "id": "ID1713440893227",
              "currentLayout": "DESKTOP",
              "isDragging": false,
              "selectedComponentId": "",
              "componentDropped": [],
              "dropPosition": {"x": 94, "y": 96},
              "index": 0
            }
          ],
          "currentLayout": "DESKTOP",
          "isDragging": false,
          "selectedComponentId": "",
          "componentDropped": [],
          "dropPosition": {"x": 84, "y": 78},
          "index": 0
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
      : queries = {
          "testadithi": {
            "isLoading": false,
            "data": {
              "data": {
                "fetchBackupEmp": [
                  {
                    "backupEmployeeCode": "00000114",
                    "backupEmployeeName": "eva n. joshua "
                  },
                  {
                    "backupEmployeeCode": "00000120",
                    "backupEmployeeName": "john joseph "
                  },
                  {
                    "backupEmployeeCode": "00013303",
                    "backupEmployeeName": "Karthik K. Guru K S "
                  },
                  {
                    "backupEmployeeCode": "00013950",
                    "backupEmployeeName": "Dannie Ambrose "
                  },
                  {
                    "backupEmployeeCode": "00014352",
                    "backupEmployeeName": "Xavier Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "01011990",
                    "backupEmployeeName": "Sushmi J "
                  },
                  {
                    "backupEmployeeCode": "02011990",
                    "backupEmployeeName": "Gomathy J "
                  },
                  {
                    "backupEmployeeCode": "03011990",
                    "backupEmployeeName": "Jeevan J "
                  },
                  {
                    "backupEmployeeCode": "04011990",
                    "backupEmployeeName": "Geetha J "
                  },
                  {
                    "backupEmployeeCode": "05011990",
                    "backupEmployeeName": "Surya J "
                  },
                  {
                    "backupEmployeeCode": "05020001",
                    "backupEmployeeName": "Sujinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "06011990",
                    "backupEmployeeName": "Ajay J "
                  },
                  {
                    "backupEmployeeCode": "06032024",
                    "backupEmployeeName": "Sujin S. Raj "
                  },
                  {
                    "backupEmployeeCode": "07011990",
                    "backupEmployeeName": "Yadav J "
                  },
                  {
                    "backupEmployeeCode": "08000091",
                    "backupEmployeeName": "David HOSKING "
                  },
                  {
                    "backupEmployeeCode": "08001574",
                    "backupEmployeeName": "Paul B. LUXTON "
                  },
                  {
                    "backupEmployeeCode": "08002427",
                    "backupEmployeeName": "Carinne C. MCRAE "
                  },
                  {
                    "backupEmployeeCode": "08011990",
                    "backupEmployeeName": "Riya J "
                  },
                  {
                    "backupEmployeeCode": "10000042",
                    "backupEmployeeName": "Megan D. Williams "
                  },
                  {
                    "backupEmployeeCode": "10000192",
                    "backupEmployeeName": "Jaelle B. Bajada "
                  },
                  {
                    "backupEmployeeCode": "10000729",
                    "backupEmployeeName": "DOMINIQUE ALZIRA C. PINTO-GREEN "
                  },
                  {
                    "backupEmployeeCode": "10001684",
                    "backupEmployeeName": "Lance BROWN "
                  },
                  {
                    "backupEmployeeCode": "10002622",
                    "backupEmployeeName": "Michael B. Innis "
                  },
                  {
                    "backupEmployeeCode": "10003113",
                    "backupEmployeeName": "Suji n. Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "10004068",
                    "backupEmployeeName": "Haily D. Booth "
                  },
                  {
                    "backupEmployeeCode": "10004442",
                    "backupEmployeeName": "Alexr D o. Manoj "
                  },
                  {
                    "backupEmployeeCode": "10004579",
                    "backupEmployeeName": "Alexr D o. Kumar "
                  },
                  {
                    "backupEmployeeCode": "10006097",
                    "backupEmployeeName": "Katherine C. Amies "
                  },
                  {
                    "backupEmployeeCode": "10006574",
                    "backupEmployeeName": "Belinda D. Rawnsley "
                  },
                  {
                    "backupEmployeeCode": "10007839",
                    "backupEmployeeName": "Cara A. Allan "
                  },
                  {
                    "backupEmployeeCode": "10007894",
                    "backupEmployeeName": "Peter B. Wilson "
                  },
                  {
                    "backupEmployeeCode": "10011990",
                    "backupEmployeeName": "Joe J "
                  },
                  {
                    "backupEmployeeCode": "10013008",
                    "backupEmployeeName": "Adam D. Jalaludin "
                  },
                  {
                    "backupEmployeeCode": "10013009",
                    "backupEmployeeName": "YULU SHELL A. Xiao "
                  },
                  {
                    "backupEmployeeCode": "10013011",
                    "backupEmployeeName": "Peter William B. FREWIN "
                  },
                  {
                    "backupEmployeeCode": "10013044",
                    "backupEmployeeName": "Robert Anthony C. VITELLI "
                  },
                  {
                    "backupEmployeeCode": "10013056",
                    "backupEmployeeName": "Tal D. Cohen Sat "
                  },
                  {
                    "backupEmployeeCode": "10014574",
                    "backupEmployeeName": "Christopher A. DIAS "
                  },
                  {
                    "backupEmployeeCode": "10014609",
                    "backupEmployeeName": "Sonja B. Mitchell "
                  },
                  {
                    "backupEmployeeCode": "10015768",
                    "backupEmployeeName": "Anthony C. Mitchell "
                  },
                  {
                    "backupEmployeeCode": "10016393",
                    "backupEmployeeName": "Pauline D. Tough "
                  },
                  {
                    "backupEmployeeCode": "10016547",
                    "backupEmployeeName": "Honi A. Anderson "
                  },
                  {
                    "backupEmployeeCode": "10016834",
                    "backupEmployeeName": "Carole B. Cast "
                  },
                  {
                    "backupEmployeeCode": "10016891",
                    "backupEmployeeName": "Adil C. Ahmad "
                  },
                  {
                    "backupEmployeeCode": "10017642",
                    "backupEmployeeName": "Abdur D. Rahman "
                  },
                  {
                    "backupEmployeeCode": "10017666",
                    "backupEmployeeName": "Stacey A. Grundy "
                  },
                  {
                    "backupEmployeeCode": "10017872",
                    "backupEmployeeName": "Amanda B. Byrne "
                  },
                  {
                    "backupEmployeeCode": "10018048",
                    "backupEmployeeName": "Amy C. Clark "
                  },
                  {
                    "backupEmployeeCode": "10018766",
                    "backupEmployeeName": "Peter D. Jolly "
                  },
                  {
                    "backupEmployeeCode": "10019785",
                    "backupEmployeeName": "Joshua A. O'Shea "
                  },
                  {
                    "backupEmployeeCode": "10020104",
                    "backupEmployeeName": "Melissa Brown "
                  },
                  {
                    "backupEmployeeCode": "10020109",
                    "backupEmployeeName": "Brett B. Morris "
                  },
                  {
                    "backupEmployeeCode": "10021709",
                    "backupEmployeeName": "David C. Marrs "
                  },
                  {
                    "backupEmployeeCode": "10021711",
                    "backupEmployeeName": "Sargis Beetmirza "
                  },
                  {
                    "backupEmployeeCode": "10022445",
                    "backupEmployeeName": "Jonathan D. Holloway "
                  },
                  {
                    "backupEmployeeCode": "10022697",
                    "backupEmployeeName": "Fang A. SHENG "
                  },
                  {
                    "backupEmployeeCode": "10023806",
                    "backupEmployeeName": "Alison B. Fairbairn "
                  },
                  {
                    "backupEmployeeCode": "10023807",
                    "backupEmployeeName": "Cheryl C. Janmaat "
                  },
                  {
                    "backupEmployeeCode": "10023808",
                    "backupEmployeeName": "Grant D. Smith "
                  },
                  {
                    "backupEmployeeCode": "10023809",
                    "backupEmployeeName": "John A. Isidori "
                  },
                  {
                    "backupEmployeeCode": "10023810",
                    "backupEmployeeName": "Kevin B. Sternberg "
                  },
                  {
                    "backupEmployeeCode": "10023812",
                    "backupEmployeeName": "Timothy C. Burley "
                  },
                  {
                    "backupEmployeeCode": "10023873",
                    "backupEmployeeName": "Dom D. Bolton "
                  },
                  {
                    "backupEmployeeCode": "10023982",
                    "backupEmployeeName": "Jose William A. Cacho "
                  },
                  {
                    "backupEmployeeCode": "10024546",
                    "backupEmployeeName": "Larina B. Palomino "
                  },
                  {
                    "backupEmployeeCode": "10024590",
                    "backupEmployeeName": "Andrew C. Barker "
                  },
                  {
                    "backupEmployeeCode": "10025639",
                    "backupEmployeeName": "Chih-Wei D. Li "
                  },
                  {
                    "backupEmployeeCode": "10025852",
                    "backupEmployeeName": "Sarah A. Wilson "
                  },
                  {
                    "backupEmployeeCode": "10026145",
                    "backupEmployeeName": "Srikanth B. Gaikwad "
                  },
                  {
                    "backupEmployeeCode": "10026419",
                    "backupEmployeeName": "Luke C. Ashwood "
                  },
                  {
                    "backupEmployeeCode": "10027604",
                    "backupEmployeeName": "Neil D. Adams "
                  },
                  {
                    "backupEmployeeCode": "10028063",
                    "backupEmployeeName": "Roderick A. Dale "
                  },
                  {
                    "backupEmployeeCode": "10028298",
                    "backupEmployeeName": "Shushilkumar Rajendrakuma B. Patel "
                  },
                  {
                    "backupEmployeeCode": "10028415",
                    "backupEmployeeName": "Gabrielle C. Chaffey "
                  },
                  {
                    "backupEmployeeCode": "10029664",
                    "backupEmployeeName": "Katherine D. Worrad "
                  },
                  {
                    "backupEmployeeCode": "10030045",
                    "backupEmployeeName": "Andrew A. Peart "
                  },
                  {
                    "backupEmployeeCode": "10030180",
                    "backupEmployeeName": "Shannon B. Short "
                  },
                  {
                    "backupEmployeeCode": "10030420",
                    "backupEmployeeName": "Donald C. McMurrich "
                  },
                  {
                    "backupEmployeeCode": "10030523",
                    "backupEmployeeName": "Kavita Leo "
                  },
                  {
                    "backupEmployeeCode": "10030706",
                    "backupEmployeeName": "Nileshkumar Pandya "
                  },
                  {
                    "backupEmployeeCode": "10031432",
                    "backupEmployeeName": "Matt A. Kenny "
                  },
                  {
                    "backupEmployeeCode": "10032139",
                    "backupEmployeeName": "Bhargavi A. Desai "
                  },
                  {
                    "backupEmployeeCode": "10032353",
                    "backupEmployeeName": "Matilda B. Hughes "
                  },
                  {
                    "backupEmployeeCode": "10032755",
                    "backupEmployeeName": "Neil C. Cordingley "
                  },
                  {
                    "backupEmployeeCode": "10033259",
                    "backupEmployeeName": "Leonard D. Ibbotson "
                  },
                  {
                    "backupEmployeeCode": "10033276",
                    "backupEmployeeName": "Alicia A. Thompson "
                  },
                  {
                    "backupEmployeeCode": "10033317",
                    "backupEmployeeName": "Jacky B. Stoneman "
                  },
                  {
                    "backupEmployeeCode": "10042014",
                    "backupEmployeeName": "Sujinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "10061234",
                    "backupEmployeeName": "Sibinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "10071234",
                    "backupEmployeeName": "Sibinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "10091234",
                    "backupEmployeeName": "Alexr D o. Kumar "
                  },
                  {
                    "backupEmployeeCode": "10101234",
                    "backupEmployeeName": "Sivapriya B S "
                  },
                  {
                    "backupEmployeeCode": "11011990",
                    "backupEmployeeName": "Kirthi J "
                  },
                  {
                    "backupEmployeeCode": "11111178",
                    "backupEmployeeName": "aa ss "
                  },
                  {
                    "backupEmployeeCode": "12011990",
                    "backupEmployeeName": "Zion J "
                  },
                  {
                    "backupEmployeeCode": "14101432",
                    "backupEmployeeName": "Magesh K "
                  },
                  {
                    "backupEmployeeCode": "15110001",
                    "backupEmployeeName": "Eva B "
                  },
                  {
                    "backupEmployeeCode": "15110002",
                    "backupEmployeeName": "Vaishali K "
                  },
                  {
                    "backupEmployeeCode": "15110003",
                    "backupEmployeeName": "Suganya M "
                  },
                  {
                    "backupEmployeeCode": "15120001",
                    "backupEmployeeName": "Manoj P "
                  },
                  {
                    "backupEmployeeCode": "16052024",
                    "backupEmployeeName": "Loggaa Sri "
                  },
                  {
                    "backupEmployeeCode": "19101910",
                    "backupEmployeeName": "Sibinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "20000123",
                    "backupEmployeeName": "Priyadharshini V "
                  },
                  {
                    "backupEmployeeCode": "20062023",
                    "backupEmployeeName": "Keshav R. Ramkumar "
                  },
                  {
                    "backupEmployeeCode": "20071234",
                    "backupEmployeeName": "Sibin S "
                  },
                  {
                    "backupEmployeeCode": "20102010",
                    "backupEmployeeName": "Sibin Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "20110001",
                    "backupEmployeeName": "Sujinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "20110002",
                    "backupEmployeeName": "Vijayalakshmi K "
                  },
                  {
                    "backupEmployeeCode": "21102110",
                    "backupEmployeeName": "Sibin Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "21110001",
                    "backupEmployeeName": "Sibinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "21110002",
                    "backupEmployeeName": "Manoj P "
                  },
                  {
                    "backupEmployeeCode": "21110003",
                    "backupEmployeeName": "Bharathi K "
                  },
                  {
                    "backupEmployeeCode": "22110001",
                    "backupEmployeeName": "Sujinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "22222222",
                    "backupEmployeeName": "Jenson Chapman "
                  },
                  {
                    "backupEmployeeCode": "23110001",
                    "backupEmployeeName": "Ravi R "
                  },
                  {
                    "backupEmployeeCode": "24000001",
                    "backupEmployeeName": "Sibinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "24000002",
                    "backupEmployeeName": "Siva Priya "
                  },
                  {
                    "backupEmployeeCode": "27110001",
                    "backupEmployeeName": "Senthil Arasu "
                  },
                  {
                    "backupEmployeeCode": "27110002",
                    "backupEmployeeName": "Krishna ABC "
                  },
                  {
                    "backupEmployeeCode": "30110001",
                    "backupEmployeeName": "Sujinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "33333333",
                    "backupEmployeeName": "ravi k "
                  },
                  {
                    "backupEmployeeCode": "50091234",
                    "backupEmployeeName": "Sibinraj S "
                  },
                  {
                    "backupEmployeeCode": "66666666",
                    "backupEmployeeName": "Jose Ruby Stella J "
                  },
                  {
                    "backupEmployeeCode": "80000091",
                    "backupEmployeeName": "David HOSKING "
                  },
                  {
                    "backupEmployeeCode": "86003559",
                    "backupEmployeeName": "ROBERTO GIOUANNI C. BATTAGLIA "
                  },
                  {
                    "backupEmployeeCode": "86003561",
                    "backupEmployeeName": "Simon D. BONNY "
                  },
                  {
                    "backupEmployeeCode": "86003565",
                    "backupEmployeeName": "Paul A. BROWN "
                  },
                  {
                    "backupEmployeeCode": "86003568",
                    "backupEmployeeName": "Anthony B. CARR "
                  },
                  {
                    "backupEmployeeCode": "86003571",
                    "backupEmployeeName": "Benjamin C. CHEW "
                  },
                  {
                    "backupEmployeeCode": "86003578",
                    "backupEmployeeName": "Doreen D. DEBRINCAT "
                  },
                  {
                    "backupEmployeeCode": "86003582",
                    "backupEmployeeName": "Timothy A. FRASER "
                  },
                  {
                    "backupEmployeeCode": "86003588",
                    "backupEmployeeName": "Keryn B. GRIBBEN "
                  },
                  {
                    "backupEmployeeCode": "86003594",
                    "backupEmployeeName": "Michelle HICKMAN "
                  },
                  {
                    "backupEmployeeCode": "86003595",
                    "backupEmployeeName": "Sam C. HOLE "
                  },
                  {
                    "backupEmployeeCode": "86003596",
                    "backupEmployeeName": "Peter D. HOLMES "
                  },
                  {
                    "backupEmployeeCode": "86003605",
                    "backupEmployeeName": "Grayson A. KILLEN "
                  },
                  {
                    "backupEmployeeCode": "86003614",
                    "backupEmployeeName": "Neville B. MARRA "
                  },
                  {
                    "backupEmployeeCode": "86003615",
                    "backupEmployeeName": "Scott C. MATHEW "
                  },
                  {
                    "backupEmployeeCode": "86003622",
                    "backupEmployeeName": "Kenneth D. MCKEE "
                  },
                  {
                    "backupEmployeeCode": "86003638",
                    "backupEmployeeName": "Kevin A. PATTERSON "
                  },
                  {
                    "backupEmployeeCode": "86003646",
                    "backupEmployeeName": "Jason B. SABEENEY "
                  },
                  {
                    "backupEmployeeCode": "86003656",
                    "backupEmployeeName": "Dugald C. SPENCELEY "
                  },
                  {
                    "backupEmployeeCode": "86003667",
                    "backupEmployeeName": "David D. VAN-RYSWYK "
                  },
                  {
                    "backupEmployeeCode": "86003670",
                    "backupEmployeeName": "Garth A. WICKSON "
                  },
                  {
                    "backupEmployeeCode": "86003674",
                    "backupEmployeeName": "Wilhelmien B. GREENWOOD "
                  },
                  {
                    "backupEmployeeCode": "86003710",
                    "backupEmployeeName": "Russell C. SLOBODIUK "
                  },
                  {
                    "backupEmployeeCode": "86004400",
                    "backupEmployeeName": "Eric D. BROWN "
                  },
                  {
                    "backupEmployeeCode": "86007314",
                    "backupEmployeeName": "Rowley A. WINTEN "
                  },
                  {
                    "backupEmployeeCode": "86007543",
                    "backupEmployeeName": "Samantha B. SHORT "
                  },
                  {
                    "backupEmployeeCode": "86007646",
                    "backupEmployeeName": "Brett C. HOFMAN "
                  },
                  {
                    "backupEmployeeCode": "86007665",
                    "backupEmployeeName": "Belinda D. WATTS "
                  },
                  {
                    "backupEmployeeCode": "86007667",
                    "backupEmployeeName": "Nicole A. MOMIROVSKI "
                  },
                  {
                    "backupEmployeeCode": "86007668",
                    "backupEmployeeName": "Michael B. TREMAINE "
                  },
                  {
                    "backupEmployeeCode": "86007672",
                    "backupEmployeeName": "Leith C. PLEVEY "
                  },
                  {
                    "backupEmployeeCode": "86007714",
                    "backupEmployeeName": "Sean D. ROBERTS "
                  },
                  {
                    "backupEmployeeCode": "86008489",
                    "backupEmployeeName": "Patricia A. DE LA MATA "
                  },
                  {
                    "backupEmployeeCode": "86008573",
                    "backupEmployeeName": "Richard B. PACKARD "
                  },
                  {
                    "backupEmployeeCode": "86008829",
                    "backupEmployeeName": "Trevor C. STEAD "
                  },
                  {
                    "backupEmployeeCode": "86008882",
                    "backupEmployeeName": "Ziba D. KHALILI "
                  },
                  {
                    "backupEmployeeCode": "86009541",
                    "backupEmployeeName": "Lorraine A. CAMLEY "
                  },
                  {
                    "backupEmployeeCode": "86010250",
                    "backupEmployeeName": "Cornelia B. SMITH "
                  },
                  {
                    "backupEmployeeCode": "86011451",
                    "backupEmployeeName": "Pooja C. NAYYAR "
                  },
                  {
                    "backupEmployeeCode": "86011902",
                    "backupEmployeeName": "James D. CONSIDINE "
                  },
                  {
                    "backupEmployeeCode": "86013066",
                    "backupEmployeeName": "Ian A. MACDONALD "
                  },
                  {
                    "backupEmployeeCode": "86013854",
                    "backupEmployeeName": "Stanley B. NOONAN "
                  },
                  {
                    "backupEmployeeCode": "86014471",
                    "backupEmployeeName": "Gerard C. SIPPEL "
                  },
                  {
                    "backupEmployeeCode": "86014607",
                    "backupEmployeeName": "Gillian D. BROOKS "
                  },
                  {
                    "backupEmployeeCode": "86014717",
                    "backupEmployeeName": "MARGARITA A. SISON "
                  },
                  {
                    "backupEmployeeCode": "86014847",
                    "backupEmployeeName": "Karen B. ZAICZ "
                  },
                  {
                    "backupEmployeeCode": "86015112",
                    "backupEmployeeName": "Ross C. BLOORE "
                  },
                  {
                    "backupEmployeeCode": "86019273",
                    "backupEmployeeName": "Darren D. BROWNE "
                  },
                  {
                    "backupEmployeeCode": "86020476",
                    "backupEmployeeName": "Terry A. ALDERDICE "
                  },
                  {
                    "backupEmployeeCode": "86020500",
                    "backupEmployeeName": "Neil B. BAUER "
                  },
                  {
                    "backupEmployeeCode": "86020739",
                    "backupEmployeeName": "Maximo C. FRATANTONI "
                  },
                  {
                    "backupEmployeeCode": "86020968",
                    "backupEmployeeName": "MARTIN D. FRANCIS "
                  },
                  {
                    "backupEmployeeCode": "86022566",
                    "backupEmployeeName": "Vicki A. TONKIN "
                  },
                  {
                    "backupEmployeeCode": "86022997",
                    "backupEmployeeName": "Emma B. MCCLELLAND "
                  },
                  {
                    "backupEmployeeCode": "86025600",
                    "backupEmployeeName": "HUI C. LI "
                  },
                  {
                    "backupEmployeeCode": "86027424",
                    "backupEmployeeName": "Charbel D. FRANCIS "
                  },
                  {
                    "backupEmployeeCode": "86027835",
                    "backupEmployeeName": "Bryan A. BUCHANAN "
                  },
                  {
                    "backupEmployeeCode": "86028695",
                    "backupEmployeeName": "Angie B. BELCHER "
                  },
                  {
                    "backupEmployeeCode": "86029048",
                    "backupEmployeeName": "Rhonda C. HALL "
                  },
                  {
                    "backupEmployeeCode": "86029716",
                    "backupEmployeeName": "Alec D. Duffy "
                  },
                  {
                    "backupEmployeeCode": "86029997",
                    "backupEmployeeName": "Alan A. COLDWELL "
                  },
                  {
                    "backupEmployeeCode": "86031710",
                    "backupEmployeeName": "Wayne B. RICHARDSON "
                  },
                  {
                    "backupEmployeeCode": "86032800",
                    "backupEmployeeName": "Rachel D. WEBB "
                  },
                  {
                    "backupEmployeeCode": "86032986",
                    "backupEmployeeName": "Leanne A. FORSYTH "
                  },
                  {
                    "backupEmployeeCode": "86033669",
                    "backupEmployeeName": "Daniel B. DOCHERTY "
                  },
                  {
                    "backupEmployeeCode": "86033809",
                    "backupEmployeeName": "Kieran C. WAUCHOPE "
                  },
                  {
                    "backupEmployeeCode": "86034020",
                    "backupEmployeeName": "Malcolm D. JONES "
                  },
                  {
                    "backupEmployeeCode": "86034629",
                    "backupEmployeeName": "Andrew A. DAYAS "
                  },
                  {
                    "backupEmployeeCode": "86036485",
                    "backupEmployeeName": "Michael B. UTTLEY "
                  },
                  {
                    "backupEmployeeCode": "86036517",
                    "backupEmployeeName": "Angus C. RUTHERFORD "
                  },
                  {
                    "backupEmployeeCode": "86036729",
                    "backupEmployeeName": "Mitchell Peter D. AMBROSE-PEARCE "
                  },
                  {
                    "backupEmployeeCode": "86036839",
                    "backupEmployeeName": "Shaun A. HOOD "
                  },
                  {
                    "backupEmployeeCode": "86037211",
                    "backupEmployeeName": "Snehalkumar B. SOLANKI "
                  },
                  {
                    "backupEmployeeCode": "86037585",
                    "backupEmployeeName": "David C. LANDMETER "
                  },
                  {
                    "backupEmployeeCode": "86037743",
                    "backupEmployeeName": "Andrew D. CHANPHAKEO "
                  },
                  {
                    "backupEmployeeCode": "86037788",
                    "backupEmployeeName": "Samantha A. PAGE "
                  },
                  {
                    "backupEmployeeCode": "86037799",
                    "backupEmployeeName": "Mireille B. CHOUEIFATY "
                  },
                  {
                    "backupEmployeeCode": "86037816",
                    "backupEmployeeName": "Hyun Ji C. KIM "
                  },
                  {
                    "backupEmployeeCode": "86037884",
                    "backupEmployeeName": "Ben D. PARKIN "
                  },
                  {
                    "backupEmployeeCode": "86038044",
                    "backupEmployeeName": "Johanna A. GENTLE "
                  },
                  {
                    "backupEmployeeCode": "86038123",
                    "backupEmployeeName": "James B. HOTTEN "
                  },
                  {
                    "backupEmployeeCode": "86038146",
                    "backupEmployeeName": "Lisa C. DILLON "
                  },
                  {
                    "backupEmployeeCode": "86038267",
                    "backupEmployeeName": "Simon D. GREGORY "
                  },
                  {
                    "backupEmployeeCode": "86038355",
                    "backupEmployeeName": "Theodora A. Areli "
                  },
                  {
                    "backupEmployeeCode": "86038373",
                    "backupEmployeeName": "Owen B. LANGLEY "
                  },
                  {
                    "backupEmployeeCode": "86038375",
                    "backupEmployeeName": "Mashaba C. ALI "
                  },
                  {
                    "backupEmployeeCode": "86038529",
                    "backupEmployeeName": "Luke Llewellyn D. BARTLETT "
                  },
                  {
                    "backupEmployeeCode": "86038649",
                    "backupEmployeeName": "Anna Elizabeth A. SUTTON "
                  },
                  {
                    "backupEmployeeCode": "86038983",
                    "backupEmployeeName": "EAN SIEW B. LOO "
                  },
                  {
                    "backupEmployeeCode": "86039208",
                    "backupEmployeeName": "Jeong Min C. SON "
                  },
                  {
                    "backupEmployeeCode": "86039269",
                    "backupEmployeeName": "Katie D. SLADE "
                  },
                  {
                    "backupEmployeeCode": "86039290",
                    "backupEmployeeName": "Michelle A. SEVILLA "
                  },
                  {
                    "backupEmployeeCode": "86039385",
                    "backupEmployeeName": "Aarany B. KUNASINGHAM "
                  },
                  {
                    "backupEmployeeCode": "86039398",
                    "backupEmployeeName": "Nicholas C. HALL "
                  },
                  {
                    "backupEmployeeCode": "86039402",
                    "backupEmployeeName": "Graham D. LESLIE "
                  },
                  {
                    "backupEmployeeCode": "86039462",
                    "backupEmployeeName": "Michael A. DE LUCA "
                  },
                  {
                    "backupEmployeeCode": "86039499",
                    "backupEmployeeName": "Gereon B. Schnippenkoetter "
                  },
                  {
                    "backupEmployeeCode": "86039500",
                    "backupEmployeeName": "William C. CROFT "
                  },
                  {
                    "backupEmployeeCode": "86039513",
                    "backupEmployeeName": "Amelia D. GLEDHILL "
                  },
                  {
                    "backupEmployeeCode": "86039579",
                    "backupEmployeeName": "Justin A. MARTIN "
                  },
                  {
                    "backupEmployeeCode": "86039927",
                    "backupEmployeeName": "Craig B. HALL "
                  },
                  {
                    "backupEmployeeCode": "86040094",
                    "backupEmployeeName": "Stephen C. BITTER "
                  },
                  {
                    "backupEmployeeCode": "86040244",
                    "backupEmployeeName": "Daniel A. GASH "
                  },
                  {
                    "backupEmployeeCode": "86040246",
                    "backupEmployeeName": "Dean B. MOSCH "
                  },
                  {
                    "backupEmployeeCode": "86040278",
                    "backupEmployeeName": "SAMUEL C. NORRIS "
                  },
                  {
                    "backupEmployeeCode": "89765432",
                    "backupEmployeeName": "eva S "
                  },
                  {
                    "backupEmployeeCode": "90000019",
                    "backupEmployeeName": "timetest t. timetest "
                  },
                  {
                    "backupEmployeeCode": "90000020",
                    "backupEmployeeName": "Thanigai M. Vendhan "
                  },
                  {
                    "backupEmployeeCode": "90000029",
                    "backupEmployeeName": "timetest t. timetest "
                  },
                  {
                    "backupEmployeeCode": "90000030",
                    "backupEmployeeName": "mobtest T "
                  },
                  {
                    "backupEmployeeCode": "IND00001",
                    "backupEmployeeName": "Oppo R "
                  },
                  {
                    "backupEmployeeCode": "ind00002",
                    "backupEmployeeName": "Samsung S "
                  },
                  {
                    "backupEmployeeCode": "ind00003",
                    "backupEmployeeName": "Apple R "
                  },
                  {
                    "backupEmployeeCode": "ind00004",
                    "backupEmployeeName": "Samco S "
                  },
                  {
                    "backupEmployeeCode": "ind00005",
                    "backupEmployeeName": "HP R "
                  },
                  {
                    "backupEmployeeCode": "KRIS0001",
                    "backupEmployeeName": "Krishna S "
                  },
                  {
                    "backupEmployeeCode": "OU419000001",
                    "backupEmployeeName": "Abishek K "
                  },
                  {
                    "backupEmployeeCode": "ou419000002",
                    "backupEmployeeName": "Jack SP "
                  },
                  {
                    "backupEmployeeCode": "ou419000003",
                    "backupEmployeeName": "Mega M "
                  },
                  {
                    "backupEmployeeCode": "ou419000005",
                    "backupEmployeeName": "Kak R "
                  },
                  {
                    "backupEmployeeCode": "ou419000006",
                    "backupEmployeeName": "kavi K "
                  },
                  {
                    "backupEmployeeCode": "t0000005",
                    "backupEmployeeName": "jfhf dfsd "
                  },
                  {
                    "backupEmployeeCode": "t0000006",
                    "backupEmployeeName": "sgdf shdkjfd "
                  },
                  {
                    "backupEmployeeCode": "t0100005",
                    "backupEmployeeName": "vihj vjdh "
                  },
                  {
                    "backupEmployeeCode": "tj000008",
                    "backupEmployeeName": "cc cin "
                  },
                  {
                    "backupEmployeeCode": "tj000053",
                    "backupEmployeeName": "cin shorty "
                  },
                  {
                    "backupEmployeeCode": "tjp00044",
                    "backupEmployeeName": "fr sf "
                  },
                  {
                    "backupEmployeeCode": "tpq00001",
                    "backupEmployeeName": "ffff ggg "
                  }
                ]
              }
            },
            "rawData": {
              "data": {
                "fetchBackupEmp": [
                  {
                    "backupEmployeeCode": "00000114",
                    "backupEmployeeName": "eva n. joshua "
                  },
                  {
                    "backupEmployeeCode": "00000120",
                    "backupEmployeeName": "john joseph "
                  },
                  {
                    "backupEmployeeCode": "00013303",
                    "backupEmployeeName": "Karthik K. Guru K S "
                  },
                  {
                    "backupEmployeeCode": "00013950",
                    "backupEmployeeName": "Dannie Ambrose "
                  },
                  {
                    "backupEmployeeCode": "00014352",
                    "backupEmployeeName": "Xavier Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "01011990",
                    "backupEmployeeName": "Sushmi J "
                  },
                  {
                    "backupEmployeeCode": "02011990",
                    "backupEmployeeName": "Gomathy J "
                  },
                  {
                    "backupEmployeeCode": "03011990",
                    "backupEmployeeName": "Jeevan J "
                  },
                  {
                    "backupEmployeeCode": "04011990",
                    "backupEmployeeName": "Geetha J "
                  },
                  {
                    "backupEmployeeCode": "05011990",
                    "backupEmployeeName": "Surya J "
                  },
                  {
                    "backupEmployeeCode": "05020001",
                    "backupEmployeeName": "Sujinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "06011990",
                    "backupEmployeeName": "Ajay J "
                  },
                  {
                    "backupEmployeeCode": "06032024",
                    "backupEmployeeName": "Sujin S. Raj "
                  },
                  {
                    "backupEmployeeCode": "07011990",
                    "backupEmployeeName": "Yadav J "
                  },
                  {
                    "backupEmployeeCode": "08000091",
                    "backupEmployeeName": "David HOSKING "
                  },
                  {
                    "backupEmployeeCode": "08001574",
                    "backupEmployeeName": "Paul B. LUXTON "
                  },
                  {
                    "backupEmployeeCode": "08002427",
                    "backupEmployeeName": "Carinne C. MCRAE "
                  },
                  {
                    "backupEmployeeCode": "08011990",
                    "backupEmployeeName": "Riya J "
                  },
                  {
                    "backupEmployeeCode": "10000042",
                    "backupEmployeeName": "Megan D. Williams "
                  },
                  {
                    "backupEmployeeCode": "10000192",
                    "backupEmployeeName": "Jaelle B. Bajada "
                  },
                  {
                    "backupEmployeeCode": "10000729",
                    "backupEmployeeName": "DOMINIQUE ALZIRA C. PINTO-GREEN "
                  },
                  {
                    "backupEmployeeCode": "10001684",
                    "backupEmployeeName": "Lance BROWN "
                  },
                  {
                    "backupEmployeeCode": "10002622",
                    "backupEmployeeName": "Michael B. Innis "
                  },
                  {
                    "backupEmployeeCode": "10003113",
                    "backupEmployeeName": "Suji n. Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "10004068",
                    "backupEmployeeName": "Haily D. Booth "
                  },
                  {
                    "backupEmployeeCode": "10004442",
                    "backupEmployeeName": "Alexr D o. Manoj "
                  },
                  {
                    "backupEmployeeCode": "10004579",
                    "backupEmployeeName": "Alexr D o. Kumar "
                  },
                  {
                    "backupEmployeeCode": "10006097",
                    "backupEmployeeName": "Katherine C. Amies "
                  },
                  {
                    "backupEmployeeCode": "10006574",
                    "backupEmployeeName": "Belinda D. Rawnsley "
                  },
                  {
                    "backupEmployeeCode": "10007839",
                    "backupEmployeeName": "Cara A. Allan "
                  },
                  {
                    "backupEmployeeCode": "10007894",
                    "backupEmployeeName": "Peter B. Wilson "
                  },
                  {
                    "backupEmployeeCode": "10011990",
                    "backupEmployeeName": "Joe J "
                  },
                  {
                    "backupEmployeeCode": "10013008",
                    "backupEmployeeName": "Adam D. Jalaludin "
                  },
                  {
                    "backupEmployeeCode": "10013009",
                    "backupEmployeeName": "YULU SHELL A. Xiao "
                  },
                  {
                    "backupEmployeeCode": "10013011",
                    "backupEmployeeName": "Peter William B. FREWIN "
                  },
                  {
                    "backupEmployeeCode": "10013044",
                    "backupEmployeeName": "Robert Anthony C. VITELLI "
                  },
                  {
                    "backupEmployeeCode": "10013056",
                    "backupEmployeeName": "Tal D. Cohen Sat "
                  },
                  {
                    "backupEmployeeCode": "10014574",
                    "backupEmployeeName": "Christopher A. DIAS "
                  },
                  {
                    "backupEmployeeCode": "10014609",
                    "backupEmployeeName": "Sonja B. Mitchell "
                  },
                  {
                    "backupEmployeeCode": "10015768",
                    "backupEmployeeName": "Anthony C. Mitchell "
                  },
                  {
                    "backupEmployeeCode": "10016393",
                    "backupEmployeeName": "Pauline D. Tough "
                  },
                  {
                    "backupEmployeeCode": "10016547",
                    "backupEmployeeName": "Honi A. Anderson "
                  },
                  {
                    "backupEmployeeCode": "10016834",
                    "backupEmployeeName": "Carole B. Cast "
                  },
                  {
                    "backupEmployeeCode": "10016891",
                    "backupEmployeeName": "Adil C. Ahmad "
                  },
                  {
                    "backupEmployeeCode": "10017642",
                    "backupEmployeeName": "Abdur D. Rahman "
                  },
                  {
                    "backupEmployeeCode": "10017666",
                    "backupEmployeeName": "Stacey A. Grundy "
                  },
                  {
                    "backupEmployeeCode": "10017872",
                    "backupEmployeeName": "Amanda B. Byrne "
                  },
                  {
                    "backupEmployeeCode": "10018048",
                    "backupEmployeeName": "Amy C. Clark "
                  },
                  {
                    "backupEmployeeCode": "10018766",
                    "backupEmployeeName": "Peter D. Jolly "
                  },
                  {
                    "backupEmployeeCode": "10019785",
                    "backupEmployeeName": "Joshua A. O'Shea "
                  },
                  {
                    "backupEmployeeCode": "10020104",
                    "backupEmployeeName": "Melissa Brown "
                  },
                  {
                    "backupEmployeeCode": "10020109",
                    "backupEmployeeName": "Brett B. Morris "
                  },
                  {
                    "backupEmployeeCode": "10021709",
                    "backupEmployeeName": "David C. Marrs "
                  },
                  {
                    "backupEmployeeCode": "10021711",
                    "backupEmployeeName": "Sargis Beetmirza "
                  },
                  {
                    "backupEmployeeCode": "10022445",
                    "backupEmployeeName": "Jonathan D. Holloway "
                  },
                  {
                    "backupEmployeeCode": "10022697",
                    "backupEmployeeName": "Fang A. SHENG "
                  },
                  {
                    "backupEmployeeCode": "10023806",
                    "backupEmployeeName": "Alison B. Fairbairn "
                  },
                  {
                    "backupEmployeeCode": "10023807",
                    "backupEmployeeName": "Cheryl C. Janmaat "
                  },
                  {
                    "backupEmployeeCode": "10023808",
                    "backupEmployeeName": "Grant D. Smith "
                  },
                  {
                    "backupEmployeeCode": "10023809",
                    "backupEmployeeName": "John A. Isidori "
                  },
                  {
                    "backupEmployeeCode": "10023810",
                    "backupEmployeeName": "Kevin B. Sternberg "
                  },
                  {
                    "backupEmployeeCode": "10023812",
                    "backupEmployeeName": "Timothy C. Burley "
                  },
                  {
                    "backupEmployeeCode": "10023873",
                    "backupEmployeeName": "Dom D. Bolton "
                  },
                  {
                    "backupEmployeeCode": "10023982",
                    "backupEmployeeName": "Jose William A. Cacho "
                  },
                  {
                    "backupEmployeeCode": "10024546",
                    "backupEmployeeName": "Larina B. Palomino "
                  },
                  {
                    "backupEmployeeCode": "10024590",
                    "backupEmployeeName": "Andrew C. Barker "
                  },
                  {
                    "backupEmployeeCode": "10025639",
                    "backupEmployeeName": "Chih-Wei D. Li "
                  },
                  {
                    "backupEmployeeCode": "10025852",
                    "backupEmployeeName": "Sarah A. Wilson "
                  },
                  {
                    "backupEmployeeCode": "10026145",
                    "backupEmployeeName": "Srikanth B. Gaikwad "
                  },
                  {
                    "backupEmployeeCode": "10026419",
                    "backupEmployeeName": "Luke C. Ashwood "
                  },
                  {
                    "backupEmployeeCode": "10027604",
                    "backupEmployeeName": "Neil D. Adams "
                  },
                  {
                    "backupEmployeeCode": "10028063",
                    "backupEmployeeName": "Roderick A. Dale "
                  },
                  {
                    "backupEmployeeCode": "10028298",
                    "backupEmployeeName": "Shushilkumar Rajendrakuma B. Patel "
                  },
                  {
                    "backupEmployeeCode": "10028415",
                    "backupEmployeeName": "Gabrielle C. Chaffey "
                  },
                  {
                    "backupEmployeeCode": "10029664",
                    "backupEmployeeName": "Katherine D. Worrad "
                  },
                  {
                    "backupEmployeeCode": "10030045",
                    "backupEmployeeName": "Andrew A. Peart "
                  },
                  {
                    "backupEmployeeCode": "10030180",
                    "backupEmployeeName": "Shannon B. Short "
                  },
                  {
                    "backupEmployeeCode": "10030420",
                    "backupEmployeeName": "Donald C. McMurrich "
                  },
                  {
                    "backupEmployeeCode": "10030523",
                    "backupEmployeeName": "Kavita Leo "
                  },
                  {
                    "backupEmployeeCode": "10030706",
                    "backupEmployeeName": "Nileshkumar Pandya "
                  },
                  {
                    "backupEmployeeCode": "10031432",
                    "backupEmployeeName": "Matt A. Kenny "
                  },
                  {
                    "backupEmployeeCode": "10032139",
                    "backupEmployeeName": "Bhargavi A. Desai "
                  },
                  {
                    "backupEmployeeCode": "10032353",
                    "backupEmployeeName": "Matilda B. Hughes "
                  },
                  {
                    "backupEmployeeCode": "10032755",
                    "backupEmployeeName": "Neil C. Cordingley "
                  },
                  {
                    "backupEmployeeCode": "10033259",
                    "backupEmployeeName": "Leonard D. Ibbotson "
                  },
                  {
                    "backupEmployeeCode": "10033276",
                    "backupEmployeeName": "Alicia A. Thompson "
                  },
                  {
                    "backupEmployeeCode": "10033317",
                    "backupEmployeeName": "Jacky B. Stoneman "
                  },
                  {
                    "backupEmployeeCode": "10042014",
                    "backupEmployeeName": "Sujinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "10061234",
                    "backupEmployeeName": "Sibinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "10071234",
                    "backupEmployeeName": "Sibinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "10091234",
                    "backupEmployeeName": "Alexr D o. Kumar "
                  },
                  {
                    "backupEmployeeCode": "10101234",
                    "backupEmployeeName": "Sivapriya B S "
                  },
                  {
                    "backupEmployeeCode": "11011990",
                    "backupEmployeeName": "Kirthi J "
                  },
                  {
                    "backupEmployeeCode": "11111178",
                    "backupEmployeeName": "aa ss "
                  },
                  {
                    "backupEmployeeCode": "12011990",
                    "backupEmployeeName": "Zion J "
                  },
                  {
                    "backupEmployeeCode": "14101432",
                    "backupEmployeeName": "Magesh K "
                  },
                  {
                    "backupEmployeeCode": "15110001",
                    "backupEmployeeName": "Eva B "
                  },
                  {
                    "backupEmployeeCode": "15110002",
                    "backupEmployeeName": "Vaishali K "
                  },
                  {
                    "backupEmployeeCode": "15110003",
                    "backupEmployeeName": "Suganya M "
                  },
                  {
                    "backupEmployeeCode": "15120001",
                    "backupEmployeeName": "Manoj P "
                  },
                  {
                    "backupEmployeeCode": "16052024",
                    "backupEmployeeName": "Loggaa Sri "
                  },
                  {
                    "backupEmployeeCode": "19101910",
                    "backupEmployeeName": "Sibinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "20000123",
                    "backupEmployeeName": "Priyadharshini V "
                  },
                  {
                    "backupEmployeeCode": "20062023",
                    "backupEmployeeName": "Keshav R. Ramkumar "
                  },
                  {
                    "backupEmployeeCode": "20071234",
                    "backupEmployeeName": "Sibin S "
                  },
                  {
                    "backupEmployeeCode": "20102010",
                    "backupEmployeeName": "Sibin Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "20110001",
                    "backupEmployeeName": "Sujinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "20110002",
                    "backupEmployeeName": "Vijayalakshmi K "
                  },
                  {
                    "backupEmployeeCode": "21102110",
                    "backupEmployeeName": "Sibin Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "21110001",
                    "backupEmployeeName": "Sibinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "21110002",
                    "backupEmployeeName": "Manoj P "
                  },
                  {
                    "backupEmployeeCode": "21110003",
                    "backupEmployeeName": "Bharathi K "
                  },
                  {
                    "backupEmployeeCode": "22110001",
                    "backupEmployeeName": "Sujinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "22222222",
                    "backupEmployeeName": "Jenson Chapman "
                  },
                  {
                    "backupEmployeeCode": "23110001",
                    "backupEmployeeName": "Ravi R "
                  },
                  {
                    "backupEmployeeCode": "24000001",
                    "backupEmployeeName": "Sibinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "24000002",
                    "backupEmployeeName": "Siva Priya "
                  },
                  {
                    "backupEmployeeCode": "27110001",
                    "backupEmployeeName": "Senthil Arasu "
                  },
                  {
                    "backupEmployeeCode": "27110002",
                    "backupEmployeeName": "Krishna ABC "
                  },
                  {
                    "backupEmployeeCode": "30110001",
                    "backupEmployeeName": "Sujinraj Selvaraj "
                  },
                  {
                    "backupEmployeeCode": "33333333",
                    "backupEmployeeName": "ravi k "
                  },
                  {
                    "backupEmployeeCode": "50091234",
                    "backupEmployeeName": "Sibinraj S "
                  },
                  {
                    "backupEmployeeCode": "66666666",
                    "backupEmployeeName": "Jose Ruby Stella J "
                  },
                  {
                    "backupEmployeeCode": "80000091",
                    "backupEmployeeName": "David HOSKING "
                  },
                  {
                    "backupEmployeeCode": "86003559",
                    "backupEmployeeName": "ROBERTO GIOUANNI C. BATTAGLIA "
                  },
                  {
                    "backupEmployeeCode": "86003561",
                    "backupEmployeeName": "Simon D. BONNY "
                  },
                  {
                    "backupEmployeeCode": "86003565",
                    "backupEmployeeName": "Paul A. BROWN "
                  },
                  {
                    "backupEmployeeCode": "86003568",
                    "backupEmployeeName": "Anthony B. CARR "
                  },
                  {
                    "backupEmployeeCode": "86003571",
                    "backupEmployeeName": "Benjamin C. CHEW "
                  },
                  {
                    "backupEmployeeCode": "86003578",
                    "backupEmployeeName": "Doreen D. DEBRINCAT "
                  },
                  {
                    "backupEmployeeCode": "86003582",
                    "backupEmployeeName": "Timothy A. FRASER "
                  },
                  {
                    "backupEmployeeCode": "86003588",
                    "backupEmployeeName": "Keryn B. GRIBBEN "
                  },
                  {
                    "backupEmployeeCode": "86003594",
                    "backupEmployeeName": "Michelle HICKMAN "
                  },
                  {
                    "backupEmployeeCode": "86003595",
                    "backupEmployeeName": "Sam C. HOLE "
                  },
                  {
                    "backupEmployeeCode": "86003596",
                    "backupEmployeeName": "Peter D. HOLMES "
                  },
                  {
                    "backupEmployeeCode": "86003605",
                    "backupEmployeeName": "Grayson A. KILLEN "
                  },
                  {
                    "backupEmployeeCode": "86003614",
                    "backupEmployeeName": "Neville B. MARRA "
                  },
                  {
                    "backupEmployeeCode": "86003615",
                    "backupEmployeeName": "Scott C. MATHEW "
                  },
                  {
                    "backupEmployeeCode": "86003622",
                    "backupEmployeeName": "Kenneth D. MCKEE "
                  },
                  {
                    "backupEmployeeCode": "86003638",
                    "backupEmployeeName": "Kevin A. PATTERSON "
                  },
                  {
                    "backupEmployeeCode": "86003646",
                    "backupEmployeeName": "Jason B. SABEENEY "
                  },
                  {
                    "backupEmployeeCode": "86003656",
                    "backupEmployeeName": "Dugald C. SPENCELEY "
                  },
                  {
                    "backupEmployeeCode": "86003667",
                    "backupEmployeeName": "David D. VAN-RYSWYK "
                  },
                  {
                    "backupEmployeeCode": "86003670",
                    "backupEmployeeName": "Garth A. WICKSON "
                  },
                  {
                    "backupEmployeeCode": "86003674",
                    "backupEmployeeName": "Wilhelmien B. GREENWOOD "
                  },
                  {
                    "backupEmployeeCode": "86003710",
                    "backupEmployeeName": "Russell C. SLOBODIUK "
                  },
                  {
                    "backupEmployeeCode": "86004400",
                    "backupEmployeeName": "Eric D. BROWN "
                  },
                  {
                    "backupEmployeeCode": "86007314",
                    "backupEmployeeName": "Rowley A. WINTEN "
                  },
                  {
                    "backupEmployeeCode": "86007543",
                    "backupEmployeeName": "Samantha B. SHORT "
                  },
                  {
                    "backupEmployeeCode": "86007646",
                    "backupEmployeeName": "Brett C. HOFMAN "
                  },
                  {
                    "backupEmployeeCode": "86007665",
                    "backupEmployeeName": "Belinda D. WATTS "
                  },
                  {
                    "backupEmployeeCode": "86007667",
                    "backupEmployeeName": "Nicole A. MOMIROVSKI "
                  },
                  {
                    "backupEmployeeCode": "86007668",
                    "backupEmployeeName": "Michael B. TREMAINE "
                  },
                  {
                    "backupEmployeeCode": "86007672",
                    "backupEmployeeName": "Leith C. PLEVEY "
                  },
                  {
                    "backupEmployeeCode": "86007714",
                    "backupEmployeeName": "Sean D. ROBERTS "
                  },
                  {
                    "backupEmployeeCode": "86008489",
                    "backupEmployeeName": "Patricia A. DE LA MATA "
                  },
                  {
                    "backupEmployeeCode": "86008573",
                    "backupEmployeeName": "Richard B. PACKARD "
                  },
                  {
                    "backupEmployeeCode": "86008829",
                    "backupEmployeeName": "Trevor C. STEAD "
                  },
                  {
                    "backupEmployeeCode": "86008882",
                    "backupEmployeeName": "Ziba D. KHALILI "
                  },
                  {
                    "backupEmployeeCode": "86009541",
                    "backupEmployeeName": "Lorraine A. CAMLEY "
                  },
                  {
                    "backupEmployeeCode": "86010250",
                    "backupEmployeeName": "Cornelia B. SMITH "
                  },
                  {
                    "backupEmployeeCode": "86011451",
                    "backupEmployeeName": "Pooja C. NAYYAR "
                  },
                  {
                    "backupEmployeeCode": "86011902",
                    "backupEmployeeName": "James D. CONSIDINE "
                  },
                  {
                    "backupEmployeeCode": "86013066",
                    "backupEmployeeName": "Ian A. MACDONALD "
                  },
                  {
                    "backupEmployeeCode": "86013854",
                    "backupEmployeeName": "Stanley B. NOONAN "
                  },
                  {
                    "backupEmployeeCode": "86014471",
                    "backupEmployeeName": "Gerard C. SIPPEL "
                  },
                  {
                    "backupEmployeeCode": "86014607",
                    "backupEmployeeName": "Gillian D. BROOKS "
                  },
                  {
                    "backupEmployeeCode": "86014717",
                    "backupEmployeeName": "MARGARITA A. SISON "
                  },
                  {
                    "backupEmployeeCode": "86014847",
                    "backupEmployeeName": "Karen B. ZAICZ "
                  },
                  {
                    "backupEmployeeCode": "86015112",
                    "backupEmployeeName": "Ross C. BLOORE "
                  },
                  {
                    "backupEmployeeCode": "86019273",
                    "backupEmployeeName": "Darren D. BROWNE "
                  },
                  {
                    "backupEmployeeCode": "86020476",
                    "backupEmployeeName": "Terry A. ALDERDICE "
                  },
                  {
                    "backupEmployeeCode": "86020500",
                    "backupEmployeeName": "Neil B. BAUER "
                  },
                  {
                    "backupEmployeeCode": "86020739",
                    "backupEmployeeName": "Maximo C. FRATANTONI "
                  },
                  {
                    "backupEmployeeCode": "86020968",
                    "backupEmployeeName": "MARTIN D. FRANCIS "
                  },
                  {
                    "backupEmployeeCode": "86022566",
                    "backupEmployeeName": "Vicki A. TONKIN "
                  },
                  {
                    "backupEmployeeCode": "86022997",
                    "backupEmployeeName": "Emma B. MCCLELLAND "
                  },
                  {
                    "backupEmployeeCode": "86025600",
                    "backupEmployeeName": "HUI C. LI "
                  },
                  {
                    "backupEmployeeCode": "86027424",
                    "backupEmployeeName": "Charbel D. FRANCIS "
                  },
                  {
                    "backupEmployeeCode": "86027835",
                    "backupEmployeeName": "Bryan A. BUCHANAN "
                  },
                  {
                    "backupEmployeeCode": "86028695",
                    "backupEmployeeName": "Angie B. BELCHER "
                  },
                  {
                    "backupEmployeeCode": "86029048",
                    "backupEmployeeName": "Rhonda C. HALL "
                  },
                  {
                    "backupEmployeeCode": "86029716",
                    "backupEmployeeName": "Alec D. Duffy "
                  },
                  {
                    "backupEmployeeCode": "86029997",
                    "backupEmployeeName": "Alan A. COLDWELL "
                  },
                  {
                    "backupEmployeeCode": "86031710",
                    "backupEmployeeName": "Wayne B. RICHARDSON "
                  },
                  {
                    "backupEmployeeCode": "86032800",
                    "backupEmployeeName": "Rachel D. WEBB "
                  },
                  {
                    "backupEmployeeCode": "86032986",
                    "backupEmployeeName": "Leanne A. FORSYTH "
                  },
                  {
                    "backupEmployeeCode": "86033669",
                    "backupEmployeeName": "Daniel B. DOCHERTY "
                  },
                  {
                    "backupEmployeeCode": "86033809",
                    "backupEmployeeName": "Kieran C. WAUCHOPE "
                  },
                  {
                    "backupEmployeeCode": "86034020",
                    "backupEmployeeName": "Malcolm D. JONES "
                  },
                  {
                    "backupEmployeeCode": "86034629",
                    "backupEmployeeName": "Andrew A. DAYAS "
                  },
                  {
                    "backupEmployeeCode": "86036485",
                    "backupEmployeeName": "Michael B. UTTLEY "
                  },
                  {
                    "backupEmployeeCode": "86036517",
                    "backupEmployeeName": "Angus C. RUTHERFORD "
                  },
                  {
                    "backupEmployeeCode": "86036729",
                    "backupEmployeeName": "Mitchell Peter D. AMBROSE-PEARCE "
                  },
                  {
                    "backupEmployeeCode": "86036839",
                    "backupEmployeeName": "Shaun A. HOOD "
                  },
                  {
                    "backupEmployeeCode": "86037211",
                    "backupEmployeeName": "Snehalkumar B. SOLANKI "
                  },
                  {
                    "backupEmployeeCode": "86037585",
                    "backupEmployeeName": "David C. LANDMETER "
                  },
                  {
                    "backupEmployeeCode": "86037743",
                    "backupEmployeeName": "Andrew D. CHANPHAKEO "
                  },
                  {
                    "backupEmployeeCode": "86037788",
                    "backupEmployeeName": "Samantha A. PAGE "
                  },
                  {
                    "backupEmployeeCode": "86037799",
                    "backupEmployeeName": "Mireille B. CHOUEIFATY "
                  },
                  {
                    "backupEmployeeCode": "86037816",
                    "backupEmployeeName": "Hyun Ji C. KIM "
                  },
                  {
                    "backupEmployeeCode": "86037884",
                    "backupEmployeeName": "Ben D. PARKIN "
                  },
                  {
                    "backupEmployeeCode": "86038044",
                    "backupEmployeeName": "Johanna A. GENTLE "
                  },
                  {
                    "backupEmployeeCode": "86038123",
                    "backupEmployeeName": "James B. HOTTEN "
                  },
                  {
                    "backupEmployeeCode": "86038146",
                    "backupEmployeeName": "Lisa C. DILLON "
                  },
                  {
                    "backupEmployeeCode": "86038267",
                    "backupEmployeeName": "Simon D. GREGORY "
                  },
                  {
                    "backupEmployeeCode": "86038355",
                    "backupEmployeeName": "Theodora A. Areli "
                  },
                  {
                    "backupEmployeeCode": "86038373",
                    "backupEmployeeName": "Owen B. LANGLEY "
                  },
                  {
                    "backupEmployeeCode": "86038375",
                    "backupEmployeeName": "Mashaba C. ALI "
                  },
                  {
                    "backupEmployeeCode": "86038529",
                    "backupEmployeeName": "Luke Llewellyn D. BARTLETT "
                  },
                  {
                    "backupEmployeeCode": "86038649",
                    "backupEmployeeName": "Anna Elizabeth A. SUTTON "
                  },
                  {
                    "backupEmployeeCode": "86038983",
                    "backupEmployeeName": "EAN SIEW B. LOO "
                  },
                  {
                    "backupEmployeeCode": "86039208",
                    "backupEmployeeName": "Jeong Min C. SON "
                  },
                  {
                    "backupEmployeeCode": "86039269",
                    "backupEmployeeName": "Katie D. SLADE "
                  },
                  {
                    "backupEmployeeCode": "86039290",
                    "backupEmployeeName": "Michelle A. SEVILLA "
                  },
                  {
                    "backupEmployeeCode": "86039385",
                    "backupEmployeeName": "Aarany B. KUNASINGHAM "
                  },
                  {
                    "backupEmployeeCode": "86039398",
                    "backupEmployeeName": "Nicholas C. HALL "
                  },
                  {
                    "backupEmployeeCode": "86039402",
                    "backupEmployeeName": "Graham D. LESLIE "
                  },
                  {
                    "backupEmployeeCode": "86039462",
                    "backupEmployeeName": "Michael A. DE LUCA "
                  },
                  {
                    "backupEmployeeCode": "86039499",
                    "backupEmployeeName": "Gereon B. Schnippenkoetter "
                  },
                  {
                    "backupEmployeeCode": "86039500",
                    "backupEmployeeName": "William C. CROFT "
                  },
                  {
                    "backupEmployeeCode": "86039513",
                    "backupEmployeeName": "Amelia D. GLEDHILL "
                  },
                  {
                    "backupEmployeeCode": "86039579",
                    "backupEmployeeName": "Justin A. MARTIN "
                  },
                  {
                    "backupEmployeeCode": "86039927",
                    "backupEmployeeName": "Craig B. HALL "
                  },
                  {
                    "backupEmployeeCode": "86040094",
                    "backupEmployeeName": "Stephen C. BITTER "
                  },
                  {
                    "backupEmployeeCode": "86040244",
                    "backupEmployeeName": "Daniel A. GASH "
                  },
                  {
                    "backupEmployeeCode": "86040246",
                    "backupEmployeeName": "Dean B. MOSCH "
                  },
                  {
                    "backupEmployeeCode": "86040278",
                    "backupEmployeeName": "SAMUEL C. NORRIS "
                  },
                  {
                    "backupEmployeeCode": "89765432",
                    "backupEmployeeName": "eva S "
                  },
                  {
                    "backupEmployeeCode": "90000019",
                    "backupEmployeeName": "timetest t. timetest "
                  },
                  {
                    "backupEmployeeCode": "90000020",
                    "backupEmployeeName": "Thanigai M. Vendhan "
                  },
                  {
                    "backupEmployeeCode": "90000029",
                    "backupEmployeeName": "timetest t. timetest "
                  },
                  {
                    "backupEmployeeCode": "90000030",
                    "backupEmployeeName": "mobtest T "
                  },
                  {
                    "backupEmployeeCode": "IND00001",
                    "backupEmployeeName": "Oppo R "
                  },
                  {
                    "backupEmployeeCode": "ind00002",
                    "backupEmployeeName": "Samsung S "
                  },
                  {
                    "backupEmployeeCode": "ind00003",
                    "backupEmployeeName": "Apple R "
                  },
                  {
                    "backupEmployeeCode": "ind00004",
                    "backupEmployeeName": "Samco S "
                  },
                  {
                    "backupEmployeeCode": "ind00005",
                    "backupEmployeeName": "HP R "
                  },
                  {
                    "backupEmployeeCode": "KRIS0001",
                    "backupEmployeeName": "Krishna S "
                  },
                  {
                    "backupEmployeeCode": "OU419000001",
                    "backupEmployeeName": "Abishek K "
                  },
                  {
                    "backupEmployeeCode": "ou419000002",
                    "backupEmployeeName": "Jack SP "
                  },
                  {
                    "backupEmployeeCode": "ou419000003",
                    "backupEmployeeName": "Mega M "
                  },
                  {
                    "backupEmployeeCode": "ou419000005",
                    "backupEmployeeName": "Kak R "
                  },
                  {
                    "backupEmployeeCode": "ou419000006",
                    "backupEmployeeName": "kavi K "
                  },
                  {
                    "backupEmployeeCode": "t0000005",
                    "backupEmployeeName": "jfhf dfsd "
                  },
                  {
                    "backupEmployeeCode": "t0000006",
                    "backupEmployeeName": "sgdf shdkjfd "
                  },
                  {
                    "backupEmployeeCode": "t0100005",
                    "backupEmployeeName": "vihj vjdh "
                  },
                  {
                    "backupEmployeeCode": "tj000008",
                    "backupEmployeeName": "cc cin "
                  },
                  {
                    "backupEmployeeCode": "tj000053",
                    "backupEmployeeName": "cin shorty "
                  },
                  {
                    "backupEmployeeCode": "tjp00044",
                    "backupEmployeeName": "fr sf "
                  },
                  {
                    "backupEmployeeCode": "tpq00001",
                    "backupEmployeeName": "ffff ggg "
                  }
                ]
              }
            }
          },
          "applyLeave2": {},
          "assignmentOptions": {"isLoading": true, "data": [], "rawData": []}
        },
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
