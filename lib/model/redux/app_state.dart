import 'package:nebula_modelling/model/redux/actions/actions.dart';

import '../../services/apiClient.dart';
import '../types/apiTypes.dart';

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
        baseUrl: 'https://hrpsaasdev.ramcouat.com',
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
    required bool showDialog,
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

  PageDetails copyWith({
    dynamic? metaData,
    String? pageId,
    dynamic? layoutDetails,
    String? modalPageId,
    dynamic? pagePrerequisiteVariables,
  }) {
    return PageDetails(
      metaData: metaData ?? this.metaData,
      pageId: pageId ?? this.pageId,
      layoutDetails: layoutDetails ?? this.layoutDetails,
      modalPageId: modalPageId ?? this.modalPageId,
      pagePrerequisiteVariables:
          pagePrerequisiteVariables ?? this.pagePrerequisiteVariables,
    );
  }

  PageDetails.initialState()
      : metaData = [],
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
  final bool showDialog; // Add showDialog state
  final String
      dialogMessage; // Add dialogMessage state for storing the dialog message
  final bool showToast; // Add showDialog state
  final String?
      toastMessage; // Add dialogMessage state for storing the dialog message

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
    required this.showDialog, // Initialize showDialog
    required this.dialogMessage, // Initialize dialogMessage
    required this.showToast, // Initialize showDialog
    this.toastMessage, // Initialize dialogMessage
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
    bool? showDialog, // Add copyWith parameter for showDialog
    String? dialogMessage, // Add copyWith parameter for dialogMessage
    bool? showToast, // Add copyWith parameter for showDialog
    String? toastMessage, // Add copyWith parameter for dialogMessage
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
      showDialog: showDialog ?? this.showDialog, // Update showDialog
      dialogMessage:
          dialogMessage ?? this.dialogMessage, // Update dialogMessage
      showToast: showToast ?? this.showToast, // Update showDialog
      toastMessage: toastMessage ?? this.toastMessage, // Update dialogMessage
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
          "assignmentOptions": {"isLoading": true, "data": [], "rawData": []},
          "getSession": {
            "isLoading": false,
            "data": {
              "data": {
                "fetchQuickCodes": [
                  {
                    "quickCode": "MSES",
                    "quickCodeDescription": "First Session"
                  },
                  {"quickCode": "FSESS", "quickCodeDescription": "I Session"},
                  {"quickCode": "SSESS", "quickCodeDescription": "II Session"},
                  {"quickCode": "TSESS", "quickCodeDescription": "III Session"},
                  {
                    "quickCode": "NIES",
                    "quickCodeDescription": "Night Session"
                  },
                  {
                    "quickCode": "NSES",
                    "quickCodeDescription": "Second Session"
                  },
                  {"quickCode": "WDAY", "quickCodeDescription": "Whole Day"}
                ]
              }
            },
            "rawData": {
              "data": {
                "fetchQuickCodes": [
                  {
                    "quickCode": "MSES",
                    "quickCodeDescription": "First Session"
                  },
                  {"quickCode": "FSESS", "quickCodeDescription": "I Session"},
                  {"quickCode": "SSESS", "quickCodeDescription": "II Session"},
                  {"quickCode": "TSESS", "quickCodeDescription": "III Session"},
                  {
                    "quickCode": "NIES",
                    "quickCodeDescription": "Night Session"
                  },
                  {
                    "quickCode": "NSES",
                    "quickCodeDescription": "Second Session"
                  },
                  {"quickCode": "WDAY", "quickCodeDescription": "Whole Day"}
                ]
              }
            }
          },
          "leaveTypeData": {
            "isLoading": false,
            "data": {
              "errors": [
                {
                  "message":
                      "The current user is not authorized to access this resource.",
                  "locations": [
                    {"line": 2, "column": 7}
                  ],
                  "path": ["fetchLeaveType"],
                  "extensions": {
                    "code": "AUTH_NOT_AUTHENTICATED",
                    "errorContext": [
                      {
                        "id": -200,
                        "source": "APP",
                        "message":
                            "The current user is not authorized to access this resource.",
                        "correctiveAction": "",
                        "severity": "Stop",
                        "errorAt": "/fetchLeaveType"
                      }
                    ],
                    "remote": {
                      "message":
                          "The current user is not authorized to access this resource.",
                      "locations": [
                        {"line": 1, "column": 23}
                      ],
                      "path": ["fetchLeaveType"],
                      "extensions": {
                        "code": "AUTH_NOT_AUTHENTICATED",
                        "errorContext": [
                          {
                            "id": -200,
                            "source": "APP",
                            "message":
                                "The current user is not authorized to access this resource.",
                            "correctiveAction": "",
                            "severity": "Stop",
                            "errorAt": "/fetchLeaveType"
                          }
                        ]
                      }
                    },
                    "schemaName": "HRPLVMSTR"
                  }
                }
              ],
              "data": {"fetchLeaveType": null}
            },
            "rawData": {
              "errors": [
                {
                  "message":
                      "The current user is not authorized to access this resource.",
                  "locations": [
                    {"line": 2, "column": 7}
                  ],
                  "path": ["fetchLeaveType"],
                  "extensions": {
                    "code": "AUTH_NOT_AUTHENTICATED",
                    "errorContext": [
                      {
                        "id": -200,
                        "source": "APP",
                        "message":
                            "The current user is not authorized to access this resource.",
                        "correctiveAction": "",
                        "severity": "Stop",
                        "errorAt": "/fetchLeaveType"
                      }
                    ],
                    "remote": {
                      "message":
                          "The current user is not authorized to access this resource.",
                      "locations": [
                        {"line": 1, "column": 23}
                      ],
                      "path": ["fetchLeaveType"],
                      "extensions": {
                        "code": "AUTH_NOT_AUTHENTICATED",
                        "errorContext": [
                          {
                            "id": -200,
                            "source": "APP",
                            "message":
                                "The current user is not authorized to access this resource.",
                            "correctiveAction": "",
                            "severity": "Stop",
                            "errorAt": "/fetchLeaveType"
                          }
                        ]
                      }
                    },
                    "schemaName": "HRPLVMSTR"
                  }
                }
              ],
              "data": {"fetchLeaveType": null}
            }
          },
          "getLeaveInfoCombos": {
            "isLoading": false,
            "data": {
              "data": {
                "fetchQuickCodes": [
                  {
                    "quickCode": "MSES",
                    "quickCodeDescription": "First Session"
                  },
                  {"quickCode": "FSESS", "quickCodeDescription": "I Session"},
                  {"quickCode": "SSESS", "quickCodeDescription": "II Session"},
                  {"quickCode": "TSESS", "quickCodeDescription": "III Session"},
                  {
                    "quickCode": "NIES",
                    "quickCodeDescription": "Night Session"
                  },
                  {
                    "quickCode": "NSES",
                    "quickCodeDescription": "Second Session"
                  },
                  {"quickCode": "WDAY", "quickCodeDescription": "Whole Day"}
                ]
              }
            },
            "rawData": {
              "data": {
                "fetchQuickCodes": [
                  {
                    "quickCode": "MSES",
                    "quickCodeDescription": "First Session"
                  },
                  {"quickCode": "FSESS", "quickCodeDescription": "I Session"},
                  {"quickCode": "SSESS", "quickCodeDescription": "II Session"},
                  {"quickCode": "TSESS", "quickCodeDescription": "III Session"},
                  {
                    "quickCode": "NIES",
                    "quickCodeDescription": "Night Session"
                  },
                  {
                    "quickCode": "NSES",
                    "quickCodeDescription": "Second Session"
                  },
                  {"quickCode": "WDAY", "quickCodeDescription": "Whole Day"}
                ]
              }
            }
          },
          "backupEmployee": {},
          "backupEmp": {
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
          "leaveReason": {},
          "backupEmployees": {},
          "assignmentOptions": {
            "isLoading": false,
            "data": {
              "data": {
                "fetchAssignment": [
                  {
                    "assignmentInformation": "Primary-Assignment~1~01/01/2023",
                    "assignmentNumber": 1,
                    "jobDesc": "NSALES",
                    "assignmentEffectiveToDate": null,
                    "positionDesc": "NSALES"
                  }
                ]
              }
            },
            "rawData": {
              "data": {
                "fetchAssignment": [
                  {
                    "assignmentInformation": "Primary-Assignment~1~01/01/2023",
                    "assignmentNumber": 1,
                    "jobDesc": "NSALES",
                    "assignmentEffectiveToDate": null,
                    "positionDesc": "NSALES"
                  }
                ]
              }
            }
          },
          "leaveTypeDatas": {
            "isLoading": false,
            "data": {
              "data": {
                "fetchLeaveType": [
                  {
                    "leavetypeCode": "EV_D1",
                    "leavetypeDesc": "Eva day based",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": true,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": false,
                    "leaveColorCode": "#BDB4FE",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "EV_H1",
                    "leavetypeDesc": "Hour based leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#0058AF",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "EV_W1",
                    "leavetypeDesc": "Weekly leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#6938EF",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": true
                  },
                  {
                    "leavetypeCode": "JCL",
                    "leavetypeDesc": "JCL",
                    "showassignInfo": true,
                    "showholidayWorkedon": true,
                    "showfromandtoSession": true,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": false,
                    "leaveColorCode": null,
                    "anniversaryOrCalendarBased": null,
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "JCOMP",
                    "leavetypeDesc": "Jcomp",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": true,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": false,
                    "leaveColorCode": "#0068CF",
                    "anniversaryOrCalendarBased": null,
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0003",
                    "leavetypeDesc": "Paid Parental Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": true,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": null,
                    "weeklyLeave": true
                  },
                  {
                    "leavetypeCode": "L0004",
                    "leavetypeDesc": "Half Paid Parental Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": true,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": null,
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0005",
                    "leavetypeDesc": "Unpaid Parental Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": true,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0006",
                    "leavetypeDesc": "Secondary Parental Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0020",
                    "leavetypeDesc": "Bereavement Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0022",
                    "leavetypeDesc": "Unpaid Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": true,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0025",
                    "leavetypeDesc": "National Disaster",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0029",
                    "leavetypeDesc": "Study Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": false,
                    "showleaveprojectedBalance": true,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": true,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": true
                  },
                  {
                    "leavetypeCode": "L0038",
                    "leavetypeDesc": "Gardening Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": false,
                    "showleaveprojectedBalance": true,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": true,
                    "showTotalHours": true,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": true
                  },
                  {
                    "leavetypeCode": "L0050",
                    "leavetypeDesc": "Community Service Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0051",
                    "leavetypeDesc": "Jury Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0052",
                    "leavetypeDesc": "Military Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0055",
                    "leavetypeDesc": "Special Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0056",
                    "leavetypeDesc": "Wellbeing Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": true
                  },
                  {
                    "leavetypeCode": "L0057",
                    "leavetypeDesc": "Workers Compensation",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "PTL",
                    "leavetypeDesc": "Paternity Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": true,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": false,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": null,
                    "weeklyLeave": false
                  }
                ]
              }
            },
            "rawData": {
              "data": {
                "fetchLeaveType": [
                  {
                    "leavetypeCode": "EV_D1",
                    "leavetypeDesc": "Eva day based",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": true,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": false,
                    "leaveColorCode": "#BDB4FE",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "EV_H1",
                    "leavetypeDesc": "Hour based leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#0058AF",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "EV_W1",
                    "leavetypeDesc": "Weekly leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#6938EF",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": true
                  },
                  {
                    "leavetypeCode": "JCL",
                    "leavetypeDesc": "JCL",
                    "showassignInfo": true,
                    "showholidayWorkedon": true,
                    "showfromandtoSession": true,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": false,
                    "leaveColorCode": null,
                    "anniversaryOrCalendarBased": null,
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "JCOMP",
                    "leavetypeDesc": "Jcomp",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": true,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": false,
                    "leaveColorCode": "#0068CF",
                    "anniversaryOrCalendarBased": null,
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0003",
                    "leavetypeDesc": "Paid Parental Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": true,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": null,
                    "weeklyLeave": true
                  },
                  {
                    "leavetypeCode": "L0004",
                    "leavetypeDesc": "Half Paid Parental Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": true,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": null,
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0005",
                    "leavetypeDesc": "Unpaid Parental Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": true,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0006",
                    "leavetypeDesc": "Secondary Parental Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0020",
                    "leavetypeDesc": "Bereavement Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0022",
                    "leavetypeDesc": "Unpaid Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": true,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0025",
                    "leavetypeDesc": "National Disaster",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0029",
                    "leavetypeDesc": "Study Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": false,
                    "showleaveprojectedBalance": true,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": true,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": true
                  },
                  {
                    "leavetypeCode": "L0038",
                    "leavetypeDesc": "Gardening Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": false,
                    "showleaveprojectedBalance": true,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": true,
                    "showTotalHours": true,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": true
                  },
                  {
                    "leavetypeCode": "L0050",
                    "leavetypeDesc": "Community Service Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0051",
                    "leavetypeDesc": "Jury Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0052",
                    "leavetypeDesc": "Military Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0055",
                    "leavetypeDesc": "Special Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "L0056",
                    "leavetypeDesc": "Wellbeing Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": true
                  },
                  {
                    "leavetypeCode": "L0057",
                    "leavetypeDesc": "Workers Compensation",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": false,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": true,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": "Calendar based",
                    "weeklyLeave": false
                  },
                  {
                    "leavetypeCode": "PTL",
                    "leavetypeDesc": "Paternity Leave",
                    "showassignInfo": true,
                    "showholidayWorkedon": false,
                    "showfromandtoSession": true,
                    "showcomputeDuration": true,
                    "showleaveprojectedBalance": false,
                    "shownotificationLink": false,
                    "showpartialleaveCancellation": false,
                    "showTotalHours": false,
                    "showNotes": false,
                    "showmultiCompoff": false,
                    "showfromandTotime": false,
                    "leaveColorCode": "#00FF00",
                    "anniversaryOrCalendarBased": null,
                    "weeklyLeave": false
                  }
                ]
              }
            }
          },
          "applyLeave": {},
          "sessionOptions": {}
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
        actions = {},
        showDialog = false, // Initialize showDialog to false
        dialogMessage = '', // Initialize dialogMessage to an empty string
        showToast = false, // Initialize showDialog to false
        toastMessage = null; // Initialize dialogMessage to an empty string
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

  DataQueries copyWith({
    List<dynamic>? dataQueries,
    bool? loadingDataQueries,
    bool? isCreatingQueryInProcess,
    bool? isUpdatingQueryInProcess,
    Map<String, dynamic>? actions,
  }) {
    return DataQueries(
      dataQueries: dataQueries ?? this.dataQueries,
      loadingDataQueries: loadingDataQueries ?? this.loadingDataQueries,
      isCreatingQueryInProcess:
          isCreatingQueryInProcess ?? this.isCreatingQueryInProcess,
      isUpdatingQueryInProcess:
          isUpdatingQueryInProcess ?? this.isUpdatingQueryInProcess,
      actions: actions ?? this.actions,
    );
  }

  DataQueries.initialState()
      : dataQueries = [],
        //  [
        //     {
        //       "id": "bef08887-a505-4d9c-99d6-0b3d6cb87dc8",
        //       "name": "getSession",
        //       "dataType": 1,
        //       "options": {
        //         "dataType": 1,
        //         "method": "POST",
        //         "url": "https://designer.ramcouat.com/coregwopsPayce/ucgsgql/",
        //         "url_params": [
        //           ["", ""]
        //         ],
        //         "headers": [
        //           ["", ""]
        //         ],
        //         "body": [
        //           ["", ""]
        //         ],
        //         "runOnPageLoad": true,
        //         "gqlHeaders": {
        //           "Content-Type": "application/json",
        //           "Authorization":
        //               "Bearer 5B5FACDEA2137262D31051434DCB7D54061FC894613D87B4CDB8D12424C813A2",
        //           "Context-Ou-Id": "23",
        //           "Context-Role-Name": "SUPER",
        //           "Context-Lang-Id": "1"
        //         },
        //         "gqlQueries":
        //             "{\"query\":\"query getSession {\\n fetchQuickCodes(bpCode: \\\"HRTM\\\" \\n  pvCode: \\\"STSE\\\"\\n) {\\n    quickCode\\n    quickCodeDescription\\n  }\\n}\",\"variables\":{}}",
        //         "authFromRuntime": true
        //       },
        //       "data_source_id": "bef08887-a505-4d9c-99d6-0b3d6cb87dc8",
        //       "app_version_id": "62f02cb3-4f8c-410a-b7a4-43de97479833",
        //       "created_at": "2024-05-15T05:50:10.220217",
        //       "updated_at": "2024-05-15T05:50:10.220217",
        //       "data_source": {"kind": "restApi"},
        //       "kind": "restApi",
        //       "orderOfExecution": null
        //     },
        //     {
        //       "id": "97240009-c293-4f4c-8327-e1419e44bcab",
        //       "name": "leaveTypeData",
        //       "dataType": 1,
        //       "options": {
        //         "dataType": 1,
        //         "method": "POST",
        //         "url": "https://designer.ramcouat.com/coregwopsPayce/ucgsgql/",
        //         "url_params": [
        //           ["", ""]
        //         ],
        //         "headers": [
        //           ["", ""]
        //         ],
        //         "body": [
        //           ["", ""]
        //         ],
        //         "runOnPageLoad": true,
        //         "gqlHeaders": {
        //           "Authorization": "",
        //           "Content-Type": "application/json",
        //           "Context-Lang-Id": "1",
        //           "Context-Ou-Id": "23",
        //           "Context-Role-Name": "SUPVR"
        //         },
        //         "gqlQueries":
        //             "{\"query\":\"query leaveTypeData {\\n      fetchLeaveType(\\n        includeInactive: true\\n        employeeCode: \\\"00013303\\\" \\n        assignmentNo: 1\\n      ) {\\n        leavetypeCode\\n        leavetypeDesc\\n        showassignInfo\\n        showholidayWorkedon\\n        showfromandtoSession\\n        showcomputeDuration\\n        showleaveprojectedBalance\\n        shownotificationLink\\n        showpartialleaveCancellation\\n        showTotalHours\\n        showNotes\\n        showmultiCompoff\\n        showfromandTotime\\n        leaveColorCode\\n        anniversaryOrCalendarBased\\n        weeklyLeave\\n      } \\n    }\\n\",\"variables\":{}}",
        //         "authFromRuntime": false
        //       },
        //       "data_source_id": "97240009-c293-4f4c-8327-e1419e44bcab",
        //       "app_version_id": "62f02cb3-4f8c-410a-b7a4-43de97479833",
        //       "created_at": "2024-06-03T09:19:06.467064",
        //       "updated_at": "2024-06-03T09:19:06.467064",
        //       "data_source": {"kind": "restApi"},
        //       "kind": "restApi",
        //       "orderOfExecution": null
        //     },
        //     {
        //       "id": "85f8bf49-5b87-464d-988e-d33e21d4b4c4",
        //       "name": "getLeaveInfoCombos",
        //       "dataType": 1,
        //       "options": {
        //         "dataType": 1,
        //         "method": "POST",
        //         "url": "https://designer.ramcouat.com/coregwopsPayce/ucgsgql/",
        //         "url_params": [
        //           ["", ""]
        //         ],
        //         "headers": [
        //           ["", ""]
        //         ],
        //         "body": [
        //           ["", ""]
        //         ],
        //         "runOnPageLoad": true,
        //         "gqlHeaders": {
        //           "Content-Type": "application/json",
        //           "Context-Lang-Id": "1",
        //           "Context-Ou-Id": "23",
        //           "Context-Role-Name": "EMP",
        //           "Authorization":
        //               "Bearer 29595F1DB97DC9B96E8A38D40923436CABFC3FFDE1F6404A5C8817502EB28327"
        //         },
        //         "gqlQueries":
        //             "{\"query\":\"query getLeaveInfoCombos {\\n   fetchQuickCodes(\\n    bpCode: \\\"HRTM\\\" \\n    pvCode: \\\"STSE\\\"\\n  ) {\\n    quickCode\\n    quickCodeDescription\\n  }\\n}\",\"variables\":{}}",
        //         "authFromRuntime": true
        //       },
        //       "data_source_id": "85f8bf49-5b87-464d-988e-d33e21d4b4c4",
        //       "app_version_id": "62f02cb3-4f8c-410a-b7a4-43de97479833",
        //       "created_at": "2024-05-12T16:11:03.094901",
        //       "updated_at": "2024-05-12T16:11:03.094901",
        //       "data_source": {"kind": "restApi"},
        //       "kind": "restApi",
        //       "orderOfExecution": null
        //     },
        //     {
        //       "id": "45189624-c67b-4d60-898b-f3b66deaf649",
        //       "name": "backupEmployee",
        //       "dataType": 1,
        //       "options": {
        //         "dataType": 1,
        //         "method": "POST",
        //         "url": "https://designer.ramcouat.com/coregwopsPayce/ucgsgql/",
        //         "url_params": [
        //           ["", ""]
        //         ],
        //         "headers": [
        //           ["", ""]
        //         ],
        //         "body": [
        //           ["", ""]
        //         ],
        //         "runOnPageLoad": false,
        //         "gqlHeaders": {
        //           "Content-Type": "application/json",
        //           "Authorization":
        //               " Bearer CD843EEA903A24D5AE446192D7162C58C5E3B964C25F999E8768DD33920F9309",
        //           "Context-Role-Name": "EMP",
        //           "Context-Ou-Id": "23",
        //           "Context-Lang-Id": "1"
        //         },
        //         "gqlQueries":
        //             "{\"query\":\"query backupEmployee {\\n    fetchBackupEmp(\\n      employeeCode: \\\"00013303\\\"\\n      \\n      ) {\\n      backupEmployeeCode\\n      backupEmployeeName\\n    }\\n  }\\n\",\"variables\":{}}",
        //         "authFromRuntime": false
        //       },
        //       "data_source_id": "45189624-c67b-4d60-898b-f3b66deaf649",
        //       "app_version_id": "62f02cb3-4f8c-410a-b7a4-43de97479833",
        //       "created_at": "2024-06-03T10:22:24.320996",
        //       "updated_at": "2024-06-03T10:22:24.320996",
        //       "data_source": {"kind": "restApi"},
        //       "kind": "restApi",
        //       "orderOfExecution": null
        //     },
        //     {
        //       "id": "3cb7b42a-cca2-47aa-a3ab-06d206105e56",
        //       "name": "backupEmp",
        //       "dataType": 1,
        //       "options": {
        //         "dataType": 1,
        //         "method": "POST",
        //         "url": "https://designer.ramcouat.com/coregwopsPayce/ucgsgql/",
        //         "url_params": [
        //           ["", ""]
        //         ],
        //         "headers": [
        //           ["", ""]
        //         ],
        //         "body": [
        //           ["", ""]
        //         ],
        //         "runOnPageLoad": true,
        //         "gqlHeaders": {
        //           "Content-Type": "application/json",
        //           "Context-Lang-Id": "1",
        //           "Context-Ou-Id": "23",
        //           "Context-Role-Name": "EMP",
        //           "Authorization":
        //               "Bearer 29595F1DB97DC9B96E8A38D40923436CABFC3FFDE1F6404A5C8817502EB28327"
        //         },
        //         "gqlQueries":
        //             "{\"query\":\"query backupEmp {\\n    fetchBackupEmp(\\n      employeeCode: \\\"00013303\\\"\\n      \\n      ) {\\n      backupEmployeeCode\\n      backupEmployeeName\\n    }\\n  }\\n\",\"variables\":{}}",
        //         "authFromRuntime": true
        //       },
        //       "data_source_id": "3cb7b42a-cca2-47aa-a3ab-06d206105e56",
        //       "app_version_id": "62f02cb3-4f8c-410a-b7a4-43de97479833",
        //       "created_at": "2024-05-12T16:09:33.845788",
        //       "updated_at": "2024-05-12T16:09:33.845788",
        //       "data_source": {"kind": "restApi"},
        //       "kind": "restApi",
        //       "orderOfExecution": null
        //     },
        //     {
        //       "id": "fec0550b-c9f8-4cf0-8dad-e1f99945f1ca",
        //       "name": "leaveReason",
        //       "dataType": 1,
        //       "options": {
        //         "dataType": 1,
        //         "method": "POST",
        //         "url": "https://designer.ramcouat.com/coregwopsPayce/ucgsgql/",
        //         "url_params": [
        //           ["", ""]
        //         ],
        //         "headers": [
        //           ["", ""]
        //         ],
        //         "body": [
        //           ["", ""]
        //         ],
        //         "runOnPageLoad": false,
        //         "gqlHeaders": {
        //           "Content-Type": "application/json",
        //           "Context-Lang-Id": "1",
        //           "Context-Ou-Id": "23",
        //           "Context-Role-Name": "EMP",
        //           "Authorization":
        //               "Bearer 29595F1DB97DC9B96E8A38D40923436CABFC3FFDE1F6404A5C8817502EB28327"
        //         },
        //         "gqlQueries":
        //             "{\"query\":\"query leaveReason \\n  {\\n    fetchLeaveReason(\\n    leavetypeCode: \\\"{{ID1715522021427336.comboValue}}\\\"\\n    includeInactive: true\\n  ) {\\n      leavereasonCode\\n      leavereasonDesc\\n    }\\n  }\\n\",\"variables\":{}}",
        //         "authFromRuntime": true
        //       },
        //       "data_source_id": "fec0550b-c9f8-4cf0-8dad-e1f99945f1ca",
        //       "app_version_id": "62f02cb3-4f8c-410a-b7a4-43de97479833",
        //       "created_at": "2024-05-12T16:10:03.564626",
        //       "updated_at": "2024-05-12T16:10:03.564626",
        //       "data_source": {"kind": "restApi"},
        //       "kind": "restApi",
        //       "orderOfExecution": null
        //     },
        //     {
        //       "id": "418b0f2d-2f79-4af1-ae2b-0c7a188b9d70",
        //       "name": "backupEmployees",
        //       "dataType": 1,
        //       "options": {
        //         "dataType": 1,
        //         "method": "POST",
        //         "url": "https://designer.ramcouat.com/coregwopsPayce/ucgsgql/",
        //         "url_params": [
        //           ["", ""]
        //         ],
        //         "headers": [
        //           ["", ""]
        //         ],
        //         "body": [
        //           ["", ""]
        //         ],
        //         "runOnPageLoad": false,
        //         "gqlHeaders": {
        //           "Content-Type": "application/json",
        //           "Authorization":
        //               " Bearer CD843EEA903A24D5AE446192D7162C58C5E3B964C25F999E8768DD33920F9309",
        //           "Context-Ou-Id": "23",
        //           "Context-Role-Name": "EMP",
        //           "Context-Lang-Id": "1"
        //         },
        //         "gqlQueries":
        //             "{\"query\":\"query backupEmployees {\\n    fetchBackupEmp(\\n      employeeCode: \\\"00013303\\\"\\n      \\n      ) {\\n      backupEmployeeCode\\n      backupEmployeeName\\n    }\\n  }\\n\",\"variables\":{}}",
        //         "authFromRuntime": false
        //       },
        //       "data_source_id": "418b0f2d-2f79-4af1-ae2b-0c7a188b9d70",
        //       "app_version_id": "62f02cb3-4f8c-410a-b7a4-43de97479833",
        //       "created_at": "2024-06-03T10:23:22.632894",
        //       "updated_at": "2024-06-03T10:23:22.632894",
        //       "data_source": {"kind": "restApi"},
        //       "kind": "restApi",
        //       "orderOfExecution": null
        //     },
        //     {
        //       "id": "d3c7e316-28c6-4e71-9706-8e88c81c7f56",
        //       "name": "assignmentOptions",
        //       "dataType": 1,
        //       "options": {
        //         "dataType": 1,
        //         "method": "POST",
        //         "url": "https://designer.ramcouat.com/coregwopsPayce/ucgsgql/",
        //         "url_params": [
        //           ["", ""]
        //         ],
        //         "headers": [
        //           ["", ""]
        //         ],
        //         "body": [
        //           ["", ""]
        //         ],
        //         "runOnPageLoad": true,
        //         "gqlHeaders": {
        //           "Content-Type": "application/json",
        //           "Authorization":
        //               "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IkI0MUU2NzE0NDk3RjEyREM1RTc3MDhCQzdCMENCNjVGQjRBRERCMkJSUzI1NiIsInR5cCI6IkpXVCIsIng1dCI6InRCNW5GRWxfRXR4ZWR3aThld3kyWDdTdDJ5cyJ9.eyJuYmYiOjE2OTU3ODY2OTEsImV4cCI6MTY5NTc5MDI5MSwiaXNzIjoiaHR0cDovL2hjbXdhcmNudjc1LnJhbWNvL2NvcmVzZWN1cml0eW9wcyIsImF1ZCI6WyJjb20ucmFtY28udndhcGllLmFkay5hcGlzIiwiaHR0cDovL2hjbXdhcmNudjc1LnJhbWNvL2NvcmVzZWN1cml0eW9wcy9yZXNvdXJjZXMiXSwiY2xpZW50X2lkIjoiMWt4a2J6enh1ZGRxZ3R3dHZvdmJ3Iiwicl9jbGllbnRfc3BuIjoiU2VydmljZXVzZXIiLCJyX3RpZCI6InJhbWNvIiwianRpIjoiRDExQUZDNkE0RTNCMUFGMUMxMjhFNDRBNTcwMkM2MzYiLCJpYXQiOjE2OTU3ODY2OTEsInNjb3BlIjpbInJ2d19pbXBlcnNvbmF0ZSJdfQ.VfUMm75ZvxOtKIfm3_GjCsoLeoDpA0PmgdYEoIqLIW6Xeskkwx7rGD_QAOKAgHYmKdPNkgRWYfSlJYBZ5omUZjrBM3HFuCXKM1nMnt4Eu8tpKf2Cp83wmA90ZfUKQWN3EyldOMDXFOx3VubzaDQW2wpngDnosXP65Vg8riofGS13iv5JlqfwZVPQNbG2qlgDTBa4g5Lz8ULzzxkfZxtg1dhPrwt-bze_w85lSOveZ5NQc-Z2I60qs5HXg7pD66wARDaxyt6GLyKgtFA3f3LvhATAELeQCZqGjN5vwdSvXx_k4yQnR_xuTn4UWXLN-31BgCo4v0B8S-rU7g-JmB9Q6w",
        //           "Context-Role-Name": "SUPER",
        //           "Context-Ou-Id": "23",
        //           "Context-Lang-Id": "1"
        //         },
        //         "gqlQueries":
        //             "{\"query\":\"query assignmentOptions {\\n    fetchAssignment(\\n      assignmentNumber: 0\\n      history: false\\n      employeeCode: \\\"00013303\\\"\\n    ) {\\n      assignmentInformation\\n      assignmentNumber\\n      jobDesc\\n      assignmentEffectiveToDate,\\n      positionDesc\\n    }\\n  }\\n\",\"variables\":{}}",
        //         "authFromRuntime": true
        //       },
        //       "data_source_id": "d3c7e316-28c6-4e71-9706-8e88c81c7f56",
        //       "app_version_id": "62f02cb3-4f8c-410a-b7a4-43de97479833",
        //       "created_at": "2024-05-15T06:10:08.942081",
        //       "updated_at": "2024-05-15T06:10:08.942081",
        //       "data_source": {"kind": "restApi"},
        //       "kind": "restApi",
        //       "orderOfExecution": null
        //     },
        //     {
        //       "id": "3f275d70-6610-4ec8-9b2e-5a2677e6e079",
        //       "name": "leaveTypeDatas",
        //       "dataType": 1,
        //       "options": {
        //         "dataType": 1,
        //         "method": "POST",
        //         "url": "https://designer.ramcouat.com/coregwopsPayce/ucgsgql/",
        //         "url_params": [
        //           ["", ""]
        //         ],
        //         "headers": [
        //           ["", ""]
        //         ],
        //         "body": [
        //           ["", ""]
        //         ],
        //         "runOnPageLoad": true,
        //         "gqlHeaders": {
        //           "Content-Type": "application/json",
        //           "Context-Lang-Id": "1",
        //           "Context-Ou-Id": "23",
        //           "Context-Role-Name": "EMP",
        //           "Authorization":
        //               "Bearer A5B9882A1E0C8D78BDF859691369290543A83BC97B3E3C8D8B7460882132AF44"
        //         },
        //         "gqlQueries":
        //             "{\"query\":\"query leaveTypeDatas {\\n  \\n    \\n      fetchLeaveType(\\n        includeInactive: true\\n        employeeCode: \\\"00013303\\\" \\n        assignmentNo: 1\\n        \\n        \\n      ) {\\n        leavetypeCode\\n        leavetypeDesc\\n        showassignInfo\\n        showholidayWorkedon\\n        showfromandtoSession\\n        showcomputeDuration\\n        showleaveprojectedBalance\\n        shownotificationLink\\n        showpartialleaveCancellation\\n        showTotalHours\\n        showNotes\\n        showmultiCompoff\\n        showfromandTotime\\n        leaveColorCode\\n        anniversaryOrCalendarBased\\n        weeklyLeave\\n      } \\n    }\\n\",\"variables\":{}}",
        //         "authFromRuntime": true
        //       },
        //       "data_source_id": "3f275d70-6610-4ec8-9b2e-5a2677e6e079",
        //       "app_version_id": "62f02cb3-4f8c-410a-b7a4-43de97479833",
        //       "created_at": "2024-05-12T16:08:56.275997",
        //       "updated_at": "2024-05-12T16:08:56.275997",
        //       "data_source": {"kind": "restApi"},
        //       "kind": "restApi",
        //       "orderOfExecution": null
        //     },
        //     {
        //       "id": "ac979f14-c5fb-4041-a78f-e7b9964d12b3",
        //       "name": "applyLeave",
        //       "dataType": 1,
        //       "options": {
        //         "dataType": 1,
        //         "method": "POST",
        //         "url": "https://designer.ramcouat.com/coregwopsPayce/ucgsgql/",
        //         "url_params": [
        //           ["", ""]
        //         ],
        //         "headers": [
        //           ["", ""]
        //         ],
        //         "body": [
        //           ["", ""]
        //         ],
        //         "runOnPageLoad": false,
        //         "gqlHeaders": {
        //           "Content-Type": "application/json",
        //           "Context-Lang-Id": "1",
        //           "Context-Ou-Id": "23",
        //           "Context-Role-Name": "EMP",
        //           "Authorization":
        //               "Bearer 29595F1DB97DC9B96E8A38D40923436CABFC3FFDE1F6404A5C8817502EB28327"
        //         },
        //         "gqlQueries":
        //             "{\"query\":\"mutation applyLeave {\\n  createLeave(\\n    leaveApplyReq: {\\n      \\n    \\n    \\n    \\n    employeeCode: \\\"00013303\\\"\\n    assignmentNo: 1\\n    leaveTypeCode: \\\"{{ID1715522021427336.comboValue}}\\\"\\n    leaveStartDate: \\\"{{ID1715767523432232.value}}\\\"\\n    leaveEndDate: \\\"{{ID1715522257956236.value}}\\\"\\n    leaveFromSession: \\\"{{ID1715522198278427.comboValue}}\\\"\\n    leaveToSession: \\\"{{ID171552229457579.comboValue}}\\\"\\n    leaveReasonCode: \\\"{{ID1715522377444139.comboValue}}\\\"\\n    additionalReason: \\\"{{ID1715522429824872.value}}\\\"\\n    backupEmployeeCode: \\\"{{ID1715522344515832.comboValue}}\\\"\\n  \\n  \\n  \\n  \\n    }\\n  ) {\\n    successMessage\\n    leaveApplicationNumber\\n  }\\n}\",\"variables\":{}}",
        //         "authFromRuntime": true
        //       },
        //       "data_source_id": "ac979f14-c5fb-4041-a78f-e7b9964d12b3",
        //       "app_version_id": "62f02cb3-4f8c-410a-b7a4-43de97479833",
        //       "created_at": "2024-05-12T16:12:56.429951",
        //       "updated_at": "2024-05-12T16:12:56.429951",
        //       "data_source": {"kind": "restApi"},
        //       "kind": "restApi",
        //       "orderOfExecution": null
        //     },
        //     {
        //       "id": "a22ee6f1-e677-4590-88d9-7be850e052ff",
        //       "name": "sessionOptions",
        //       "dataType": 1,
        //       "options": {
        //         "dataType": 1,
        //         "method": "POST",
        //         "url": "https://designer.ramcouat.com/coregwopsPayce/ucgsgql/",
        //         "url_params": [
        //           ["", ""]
        //         ],
        //         "headers": [
        //           ["", ""]
        //         ],
        //         "body": [
        //           ["", ""]
        //         ],
        //         "runOnPageLoad": false,
        //         "gqlHeaders": {
        //           "Authorization":
        //               " Bearer 0942ECB58F5AB43B62C529BA07162283071589F4B9E0FF85F719E9F7DD9FB3D8",
        //           "Content-Type": "application/json",
        //           "Context-Lang-Id": "1",
        //           "Context-Ou-Id": "23",
        //           "Context-Role-Name": "SUPVR"
        //         },
        //         "gqlQueries":
        //             "{\"query\":\"query sessionOptions {\\n fetchQuickCodes(bpCode: \\\"HRTM\\\" \\n  pvCode: \\\"STSE\\\"\\n) {\\n    quickCode\\n    quickCodeDescription\\n  }\\n}\",\"variables\":{}}",
        //         "authFromRuntime": false
        //       },
        //       "data_source_id": "a22ee6f1-e677-4590-88d9-7be850e052ff",
        //       "app_version_id": "62f02cb3-4f8c-410a-b7a4-43de97479833",
        //       "created_at": "2024-06-03T09:51:35.126121",
        //       "updated_at": "2024-06-03T09:51:35.126121",
        //       "data_source": {"kind": "restApi"},
        //       "kind": "restApi",
        //       "orderOfExecution": null
        //     }
        //   ],
        loadingDataQueries = true,
        isCreatingQueryInProcess = false,
        isUpdatingQueryInProcess = false,
        actions = {};
}

// class CurrentContext {
//   final Map<String, dynamic> setOuData;
//   final Map<String, dynamic> menuContext;
//   final Map<String, dynamic> pageContext;
//   final Map<String, dynamic> userContext;
//   final Map<String, dynamic> settings;
//   final Map<String, dynamic> authContext;
//   final Map<String, dynamic> preferenceContext;
//   final Map<String, dynamic> navData;
//   final Map<String, dynamic> dialogInfo;
//   final Map<String, dynamic> drawerInfo;
//   final Map<String, dynamic> precisionContext;

//   CurrentContext({
//     required this.setOuData,
//     required this.menuContext,
//     required this.pageContext,
//     required this.userContext,
//     required this.settings,
//     required this.authContext,
//     required this.preferenceContext,
//     required this.navData,
//     required this.dialogInfo,
//     required this.drawerInfo,
//     required this.precisionContext,
//   });

//   CurrentContext.initialState()
//       : setOuData = {},
//         menuContext = {},
//         pageContext = {},
//         userContext = {},
//         settings = {},
//         authContext = {},
//         preferenceContext = {},
//         navData = {},
//         dialogInfo = {},
//         drawerInfo = {},
//         precisionContext = {};
// }

class CurrentContext {
  final Map<String, dynamic> setOuData;
  final Map<String, dynamic> menuContext;
  final Map<String, dynamic> pageContext;
  final Map<String, dynamic> userContext;
  final Map<String, dynamic> settings;
  final dynamic authContext;
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

  // Method to update authContext with tokenResponse
  CurrentContext copyWithTokenResponse(dynamic? tokenResponse) {
    // final updatedAuthContext = Map<String, dynamic>.from(authContext)
    //   ..['tokenResponse'] = tokenResponse;

    return CurrentContext(
      setOuData: setOuData,
      menuContext: menuContext,
      pageContext: pageContext,
      userContext: userContext,
      settings: settings,
      authContext: tokenResponse,
      preferenceContext: preferenceContext,
      navData: navData,
      dialogInfo: dialogInfo,
      drawerInfo: drawerInfo,
      precisionContext: precisionContext,
    );
  }
}
