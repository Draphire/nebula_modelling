import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:nebula_modelling/renderer/page.dart';
import 'package:nebula_modelling/services/apiClient.dart';
import 'package:nebula_modelling/styles/themes.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

const String _clientId = 'com.nebula.ramco.clients';
const String _authorizeEndpoint =
    'https://hrpsaasdemo.ramcouat.com:4602/coresecurityops/connect/authorize';
const String _tokenEndpoint =
    'https://hrpsaasdemo.ramcouat.com:4602/coresecurityops/connect/token';
const String _redirectUri = 'https://hrpsaasdemo.ramcouat.com:4602/app/saas';
const identifier = '1kxkbzzxuddqgtwtvovbw';
const _clientSecret =
    'KJkcK3DqZi6yNo8hdd1lUQsGtd0mbNN9zn0fBLI0wbVsSas6Yteif6Sp7yCoP13D';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nebula',
      theme: nebulaTheme,
      home: NebulaBaseComponent(appTitle: 'Nebula'),
    );
  }
}

class NebulaBaseComponent extends StatefulWidget {
  NebulaBaseComponent({super.key, required this.appTitle});
  final String appTitle;
  final ApiClient apiClient =
      new ApiClient(baseUrl: "https://hrpsaasdemo.ramcouat.com:4602", headers: {
    'Content-Type': 'application/json',
  });

  @override
  State<NebulaBaseComponent> createState() => _NebulaBaseComponentState();
}

class _NebulaBaseComponentState extends State<NebulaBaseComponent> {
  dynamic authToken;
  Future<String> _authClientCredentials(
      Uri authorizationEndpoint, String identifier, String clientSecret) async {
    // print("came here too ${authorizationEndpoint}");
    final response = await http.post(authorizationEndpoint, headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }, body: {
      'grant_type': 'client_credentials',
      'client_id': identifier,
      'client_secret': clientSecret
    });
    // print("token");
    // print(response.statusCode);
    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['access_token'];
      // print('${token}');
      return token;
    } else {
      throw Exception('failed to get token');
    }
  }

  void authenticate() {
    // print("came here");
    _authClientCredentials(Uri.parse(_tokenEndpoint), identifier, _clientSecret)
        .then((value) => {
              setState(
                () {
                  // print('token ${value}');
                  authToken = value;
                },
              )
            });

    // print(authToken.toString());
  }

  @override
  void initState() {
    super.initState();
    // widget.apiClient = new ApiClient(
    //     baseUrl: "https://hrpsaasdemo.ramcouat.com:4602",
    //     headers: {
    //       'Content-Type': 'application/json',
    //     });
    // widget.apiClient.authenticate();
    bootstrapGridParameters(
      gutterSize: 30,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (authToken == null) {
      dynamic token = widget.apiClient.authClientCredentials().then((value) {
        setState(() {
          authToken = value;
        });
      });
      // print('2-${authToken} ${token}');

      return Center(
          child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 2.0,
      ));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.appTitle),
        ),
        body: SingleChildScrollView(
          child: BootstrapContainer(
            children: [
              PageRenderer(
                apiClient: widget.apiClient,
              )
            ]

            //   BootstrapRow(
            //     height: 60,
            //     children: <BootstrapCol>[
            //       BootstrapCol(
            //         sizes: 'col-6',
            //         child: Text(
            //           'col 2 of 2',
            //         ),
            //       ),
            //       BootstrapCol(
            //         sizes: 'col-6',
            //         child: Text(
            //           'col 2 of 2',
            //         ),
            //       ),
            //     ],
            //   ),
            ,
          ),
        ),
      );
    }
  }
}
