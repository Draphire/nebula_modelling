import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:nebula_modelling/renderer/page.dart';
import 'package:nebula_modelling/services/apiClient.dart';
import 'package:nebula_modelling/styles/themes.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import './model/redux/actions/actions.dart';

import './model/redux/middleware/middleware.dart';
import './model/redux/reducers/reducers.dart';
import 'model/redux/app_state.dart';
import 'model/redux/viewModel/viewModel.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [...appMiddleware(), thunkMiddleware],
  );

  runApp(MyApp(store: store));
  // runApp(
  //   ChangeNotifierProvider(
  //     create: (context) => MetadataProvider(),
  //     child: const MyApp(),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({required this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Nebula',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NebulaBaseComponent(appTitle: 'Nebula'),
      ),
    );
  }
}

class NebulaBaseComponent extends StatefulWidget {
  NebulaBaseComponent({super.key, required this.appTitle});
  final String appTitle;
  // final ApiClient apiClient =
  //     new ApiClient(baseUrl: "https://hrpsaasdev.ramcouat.com", headers: {
  //   'Content-Type': 'application/json',
  // });

  @override
  State<NebulaBaseComponent> createState() => _NebulaBaseComponentState();
}

class _NebulaBaseComponentState extends State<NebulaBaseComponent> {
  dynamic authToken;

  void authenticate() {
    // print("came here");
    // widget.apiClient.authClientCredentials().then((value) => {
    //       setState(
    //         () {
    //           // print('token ${value}');
    //           authToken = value;
    //         },
    //       )
    //     });

    // print(authToken.toString());
  }

  @override
  void initState() {
    super.initState();
    // final metadataProvider =
    //     Provider.of<MetadataProvider>(context, listen: false);

    // metadataProvider.setMetadata({
    //   "children": [
    //     {
    //       "controlType": "container",
    //       "layout": {
    //         "colLayout": {
    //           "xl": 12,
    //           "lg": 12,
    //           "md": 12,
    //           "sm": 12,
    //           "xs": 12,
    //         }
    //       },
    //       "children": [
    //         {
    //           "controlType": "label",
    //           "caption": "User Management",
    //           "type": "h1",
    //           "layout": {
    //             "colLayout": {
    //               "xl": 6,
    //               "lg": 6,
    //               "md": 6,
    //               "sm": 8,
    //               "xs": 8,
    //             },
    //             "spacing": {"mb": 2, "mt": 2}
    //           }
    //         },
    //         {
    //           "controlType": "button",
    //           "caption": "Add",
    //           "endIcon": {"controlType": "icon", "iconKey": "UseraddStroke"},
    //           "layout": {
    //             "colLayout": {
    //               "xl": 12,
    //               "lg": 12,
    //               "md": 4,
    //               "sm": 4,
    //               "xs": 4,
    //             }
    //           }
    //         },
    //         {
    //           "controlType": "textfield",
    //           "caption": "Search",
    //           "placeholder": "Search user",
    //           "id": "search",
    //           "layout": {
    //             "colLayout": {
    //               "xl": 12,
    //               "lg": 12,
    //               "md": 12,
    //               "sm": 12,
    //               "xs": 12,
    //             }
    //           }
    //         },
    //         {
    //           "controlType": "textfield",
    //           "caption": "Username",
    //           "placeholder": "username",
    //           "id": "Username",
    //           "layout": {
    //             "colLayout": {
    //               "xl": 12,
    //               "lg": 12,
    //               "md": 12,
    //               "sm": 12,
    //               "xs": 12,
    //             }
    //           }
    //         },
    //         {
    //           "controlType": "textfield",
    //           "caption": "Userdescription",
    //           "placeholder": "User description",
    //           "id": "Userdescription",
    //           "layout": {
    //             "colLayout": {
    //               "xl": 12,
    //               "lg": 12,
    //               "md": 12,
    //               "sm": 12,
    //               "xs": 12,
    //             }
    //           }
    //         },
    //         {
    //           "controlType": "textfield",
    //           "caption": "Email",
    //           "placeholder": "Email",
    //           "id": "Email",
    //           "layout": {
    //             "colLayout": {
    //               "xl": 12,
    //               "lg": 12,
    //               "md": 12,
    //               "sm": 12,
    //               "xs": 12,
    //             }
    //           }
    //         },
    //         {
    //           "controlType": "button",
    //           "caption": "Add",
    //           "endIcon": {"controlType": "icon", "iconKey": "UseraddStroke"},
    //           "layout": {
    //             "colLayout": {
    //               "xl": 12,
    //               "lg": 12,
    //               "md": 4,
    //               "sm": 6,
    //               "xs": 2,
    //             }
    //           }
    //         },
    //       ]
    //     },
    //   ]
    // });
    // widget.apiClient = new ApiClient(
    //     baseUrl: "https://hrpsaasdemo.ramcouat.com",
    //     headers: {
    //       'Content-Type': 'application/json',
    //     });
    // widget.apiClient.authenticate();
    bootstrapGridParameters(
      gutterSize: 30,
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //  final metadataProvider = Provider.of<MetadataProvider>(context, listen: true);
  // Example of setting metadata
  // final metadataProvider =
  //     Provider.of<MetadataProvider>(context, listen: true);
  // metadataProvider.setMetadata({
  //   "children": [
  //     {
  //       "controlType": "container",
  //       "layout": {
  //         "colLayout": {
  //           "xl": 12,
  //           "lg": 12,
  //           "md": 12,
  //           "sm": 12,
  //           "xs": 12,
  //         }
  //       },
  //       "children": [
  //         {
  //           "controlType": "label",
  //           "caption": "User Management",
  //           "type": "h1",
  //           "layout": {
  //             "colLayout": {
  //               "xl": 6,
  //               "lg": 6,
  //               "md": 6,
  //               "sm": 8,
  //               "xs": 8,
  //             },
  //             "spacing": {"mb": 2, "mt": 2}
  //           }
  //         },
  //         {
  //           "controlType": "button",
  //           "caption": "Add",
  //           "endIcon": {"controlType": "icon", "iconKey": "UseraddStroke"},
  //           "layout": {
  //             "colLayout": {
  //               "xl": 12,
  //               "lg": 12,
  //               "md": 4,
  //               "sm": 4,
  //               "xs": 4,
  //             }
  //           }
  //         },
  //         {
  //           "controlType": "textfield",
  //           "caption": "Search",
  //           "placeholder": "Search user",
  //           "id": "search",
  //           "layout": {
  //             "colLayout": {
  //               "xl": 12,
  //               "lg": 12,
  //               "md": 12,
  //               "sm": 12,
  //               "xs": 12,
  //             }
  //           }
  //         },
  //         {
  //           "controlType": "textfield",
  //           "caption": "Username",
  //           "placeholder": "username",
  //           "id": "Username",
  //           "layout": {
  //             "colLayout": {
  //               "xl": 12,
  //               "lg": 12,
  //               "md": 12,
  //               "sm": 12,
  //               "xs": 12,
  //             }
  //           }
  //         },
  //         {
  //           "controlType": "textfield",
  //           "caption": "Userdescription",
  //           "placeholder": "User description",
  //           "id": "Userdescription",
  //           "layout": {
  //             "colLayout": {
  //               "xl": 12,
  //               "lg": 12,
  //               "md": 12,
  //               "sm": 12,
  //               "xs": 12,
  //             }
  //           }
  //         },
  //         {
  //           "controlType": "textfield",
  //           "caption": "Email",
  //           "placeholder": "Email",
  //           "id": "Email",
  //           "layout": {
  //             "colLayout": {
  //               "xl": 12,
  //               "lg": 12,
  //               "md": 12,
  //               "sm": 12,
  //               "xs": 12,
  //             }
  //           }
  //         },
  //         {
  //           "controlType": "button",
  //           "caption": "Add",
  //           "endIcon": {"controlType": "icon", "iconKey": "UseraddStroke"},
  //           "layout": {
  //             "colLayout": {
  //               "xl": 12,
  //               "lg": 12,
  //               "md": 4,
  //               "sm": 6,
  //               "xs": 2,
  //             }
  //           }
  //         },
  //       ]
  //     },
  //   ]
  // });
  // // if (authToken == null) {
  //   dynamic token = widget.apiClient.authClientCredentials().then((value) {
  //     setState(() {
  //       authToken = value;
  //     });
  //   });
  //   // print('2-${authToken} ${token}');

  //   return Center(
  //       child: CircularProgressIndicator(
  //     backgroundColor: Colors.white,
  //     strokeWidth: 2.0,
  //   ));
  // } else {

  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.appTitle),
  //     ),
  //     body: SingleChildScrollView(
  //       child: BootstrapContainer(
  //         children: [
  //           PageRenderer(
  //             apiClient: widget.apiClient,
  //           )
  //         ]

  //         //   BootstrapRow(
  //         //     height: 60,
  //         //     children: <BootstrapCol>[
  //         //       BootstrapCol(
  //         //         sizes: 'col-6',
  //         //         child: Text(
  //         //           'col 2 of 2',
  //         //         ),
  //         //       ),
  //         //       BootstrapCol(
  //         //         sizes: 'col-6',
  //         //         child: Text(
  //         //           'col 2 of 2',
  //         //         ),
  //         //       ),
  //         //     ],
  //         //   ),
  //         ,
  //       ),
  //     ),
  //   );
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      converter: (Store<AppState> store) => ViewModel.create(store),
      builder: (BuildContext context, ViewModel viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.appTitle),
          ),
          body: SingleChildScrollView(
            child: BootstrapContainer(
              children: [
                PageRenderer(
                  metadata: viewModel.metadata,
                  apiClient: viewModel.apiClient,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
