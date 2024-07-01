import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nebula_modelling/renderer/page.dart';
import 'package:nebula_modelling/utils/oidc_client.dart';
import 'package:nebula_modelling/widgets/reusableButton.dart';
import 'package:nebula_modelling/widgets/reusableDialog.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'model/redux/actions/actions.dart';
import 'model/redux/middleware/middleware.dart';
import 'model/redux/reducers/reducers.dart';
import 'model/redux/app_state.dart';
import 'model/redux/viewModel/viewModel.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [...appMiddleware(), thunkMiddleware],
  );
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store});

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

    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'OIDC Authentication',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (RouteSettings settings) {
          final Uri uri = Uri.parse(settings.name ?? '/');
          print('Navigating to: ${uri.path}');

          if (uri.path == '/app/callback') {
            return MaterialPageRoute(
              builder: (context) =>
                  OAuthCallbackPage(baseUrl: _getBaseUrl(), store: store),
              settings: settings,
            );
          } else if (uri.path == '/nebula') {
            // Check if the user is authenticated
            final token =
                store.state.currentContext.authContext["access_token"];
            if (token != null) {
              return MaterialPageRoute(
                builder: (context) => NebulaBaseComponent(appTitle: 'Nebula'),
                settings: settings,
              );
            } else {
              // Redirect to sign-in page if not authenticated
              return MaterialPageRoute(
                builder: (context) => HomePage(baseUrl: _getBaseUrl()),
                settings: settings,
              );
            }
          }
          return MaterialPageRoute(
            builder: (context) => HomePage(baseUrl: _getBaseUrl()),
            settings: settings,
          );
        },
        initialRoute: currentUri.path,
      ),
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
      Navigator.of(context).pushReplacementNamed('/nebula');
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
  final Store<AppState> store;

  OAuthCallbackPage({required this.baseUrl, required this.store});

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
        // Dispatch the action to update the token in authContext
        widget.store.dispatch(UpdateTokenResponseAction(token));
        // Navigate to the home page or update the UI as needed
        Navigator.of(context).pushReplacementNamed('/nebula');
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

class NebulaBaseComponent extends StatefulWidget {
  final String appTitle;

  NebulaBaseComponent({required this.appTitle});

  @override
  State<NebulaBaseComponent> createState() => _NebulaBaseComponentState();
}

class _NebulaBaseComponentState extends State<NebulaBaseComponent> {
  @override
  void initState() {
    super.initState();
    bootstrapGridParameters(gutterSize: 30);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      converter: (Store<AppState> store) => ViewModel.create(store),
      builder: (BuildContext context, ViewModel viewModel) {
        //    final store = StoreProvider.of<AppState>(context);
        // final viewModel = PageMetadataViewModel(store);

        // Call the fetchPageMetadata method with the token when the app starts
        // viewModel.fetchPageMetadata();
        // Show toast if there's a toast message
        if (viewModel.toastMessage != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Fluttertoast.showToast(
              msg: viewModel.toastMessage!,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          });
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.appTitle),
          ),
          body: SingleChildScrollView(
            child: BootstrapContainer(
              children: [
                ReusableDialog(),
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
