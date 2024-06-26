import 'package:flutter/material.dart';
import 'package:nebula_modelling/utils/app_settings.dart';
import 'package:nebula_modelling/utils/oidc_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final oidcClient = OidcClient(
    authority: AppSettings.RIDS_AUTH_URL,
    clientId: AppSettings.RIDS_AUTH_CLIENTID,
    redirectUri: AppSettings.CALLBACK_URL,
    responseType: 'code',
    scope: AppSettings.RIDS_AUTH_SCOPE,
    postLogoutRedirectUri:
        AppSettings.BASE_APP_URL + "/" + AppSettings.BASE_APP_NAME,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authenticate(context);
    });
  }

  Future<void> _authenticate(BuildContext context) async {
    try {
      await oidcClient.signInRedirect();
    } catch (e) {
      print('Authentication failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OAuth2 Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              await oidcClient.signOutRedirect();
            } catch (e) {
              print('Logout failed: $e');
            }
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}



// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_bootstrap/flutter_bootstrap.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:nebula_modelling/renderer/page.dart';
// import 'package:nebula_modelling/services/apiClient.dart';
// import 'package:nebula_modelling/styles/themes.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:nebula_modelling/widgets/reUsableDialog.dart';
// import 'package:nebula_modelling/widgets/reusableButton.dart';
// import 'package:nebula_modelling/widgets/reusableToast.dart';
// import 'package:redux/redux.dart';
// import 'package:redux_thunk/redux_thunk.dart';
// import './model/redux/actions/actions.dart';
// import './model/redux/middleware/middleware.dart';
// import './model/redux/reducers/reducers.dart';
// import 'model/redux/app_state.dart';
// import 'model/redux/viewModel/viewModel.dart';

// void main() {
//   final store = Store<AppState>(
//     appReducer,
//     initialState: AppState.initial(),
//     middleware: [...appMiddleware(), thunkMiddleware],
//   );
//   // Dispatch the AppStartAction to start the authorization process
//   store.dispatch(AuthorizeApiClientAction());
//   runApp(MyApp(store: store));
// }

// class MyApp extends StatelessWidget {
//   final Store<AppState> store;
//   MyApp({required this.store});

//   @override
//   Widget build(BuildContext context) {
//     return StoreProvider(
//       store: store,
//       child: MaterialApp(
//         title: 'Nebula',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: NebulaBaseComponent(appTitle: 'Nebula'),
//       ),
//     );
//   }
// }

// class NebulaBaseComponent extends StatefulWidget {
//   final String appTitle;

//   NebulaBaseComponent({super.key, required this.appTitle});

//   @override
//   State<NebulaBaseComponent> createState() => _NebulaBaseComponentState();
// }

// class _NebulaBaseComponentState extends State<NebulaBaseComponent> {
//   @override
//   void initState() {
//     super.initState();
//     bootstrapGridParameters(gutterSize: 30);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StoreConnector<AppState, ViewModel>(
//       converter: (Store<AppState> store) => ViewModel.create(store),
//       builder: (BuildContext context, ViewModel viewModel) {
//         // Show toast if there's a toast message
//         if (viewModel.toastMessage != null) {
//           WidgetsBinding.instance!.addPostFrameCallback((_) {
//             Fluttertoast.showToast(
//               msg: viewModel.toastMessage!,
//               toastLength: Toast.LENGTH_SHORT,
//               gravity: ToastGravity.BOTTOM,
//               timeInSecForIosWeb: 1,
//               backgroundColor: Colors.black,
//               textColor: Colors.white,
//               fontSize: 16.0,
//             );
//           });
//         }
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(widget.appTitle),
//           ),
//           body: SingleChildScrollView(
//             child: BootstrapContainer(
//               children: [
//                 Center(
//                   child: ReusableButton(
//                     label: 'Fetch Data and Show Messages',
//                     apiEndpoint: 'https://jsonplaceholder.typicode.com/posts/1',
//                     dialogMessage: 'Fetching data...',
//                     toastMessage: 'Data fetched successfully!',
//                   ),
//                 ),
//                 ReusableDialog(),

//                 // ReusableToast(),
//                 PageRenderer(
//                   metadata: viewModel.metadata,
//                   apiClient: viewModel.apiClient,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

