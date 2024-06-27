import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:nebula_modelling/utils/oidc_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String baseUrl;

  MyApp() : baseUrl = _getBaseUrl();

  static String _getBaseUrl() {
    final url = html.window.location.href;
    print('Current URL: $url');
    if (url.contains('localhost:3000')) {
      return 'http://localhost:3000';
    }
    return '${html.window.location.protocol}//${html.window.location.host}';
  }

  @override
  Widget build(BuildContext context) {
    final currentUri = Uri.parse(html.window.location.href);
    print('Navigating to: ${currentUri.path}');

    return MaterialApp(
      title: 'OIDC Authentication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        final Uri uri = Uri.parse(settings.name ?? '/');
        print('Navigating to: ${uri.path}');

        if (uri.path == '/app/callback') {
          return MaterialPageRoute(
            builder: (context) => OAuthCallbackPage(baseUrl: baseUrl),
            settings: settings,
          );
        }
        return MaterialPageRoute(
          builder: (context) => HomePage(baseUrl: baseUrl),
          settings: settings,
        );
      },
      initialRoute: currentUri.path,
    );
  }
}

class HomePage extends StatefulWidget {
  final String baseUrl;

  HomePage({required this.baseUrl});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _authStatus = 'Not authenticated';
  Map<String, dynamic>? _userInfo;

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    // Implement any logic to check if the user is already authenticated
    // For example, check if there is a valid access token in storage
    // If authenticated, update the _authStatus and _userInfo state variables
  }

  Future<void> _signIn() async {
    try {
      await oidcClient.signInRedirect();
      setState(() {
        _authStatus = 'Authenticated';
        // Update _userInfo with the user's information
      });
    } catch (e) {
      setState(() {
        _authStatus = 'Failed to authenticate: $e';
      });
    }
  }

  Future<void> _signOut() async {
    try {
      await oidcClient.signOutRedirect();
      setState(() {
        _authStatus = 'Not authenticated';
        _userInfo = null;
      });
    } catch (e) {
      setState(() {
        _authStatus = 'Failed to sign out: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OIDC Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Auth Status: $_authStatus',
            ),
            if (_userInfo != null) ...[
              Text('User Info:'),
              Text(_userInfo.toString()),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signIn,
              child: Text('Sign In'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _signOut,
              child: Text('Sign Out'),
            )
          ],
        ),
      ),
    );
  }
}

class OAuthCallbackPage extends StatefulWidget {
  final String baseUrl;

  OAuthCallbackPage({required this.baseUrl});

  @override
  _OAuthCallbackPageState createState() => _OAuthCallbackPageState();
}

class _OAuthCallbackPageState extends State<OAuthCallbackPage> {
  @override
  void initState() {
    super.initState();
    _handleCallback();
  }

  Future<void> _handleCallback() async {
    final uri = Uri.parse(html.window.location.href);
    final code = uri.queryParameters['code'];
    print('Callback URL: ${html.window.location.href}');
    print('Authorization code: $code');

    if (code != null) {
      try {
        final token =
            await oidcClient.handleCallback(html.window.location.href);
        // Store the token and update the application state accordingly
        // For example, you can navigate to the home page or update the UI
        Navigator.of(context).pushReplacementNamed('/');
      } catch (e) {
        // Handle any errors that occur during the token exchange
        print('Failed to get token: $e');
      }
    } else {
      // Handle the case where the authorization code is not present in the URL
      print('Authorization code not found in URL');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Processing OAuth Callback'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
