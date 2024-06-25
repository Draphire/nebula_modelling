import 'package:nebula_modelling/utils/configuration.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'dart:io';

class AuthService {
  final authorizationEndpoint = Uri.parse(AppSettings.REACT_APP_RIDS_AUTH_URL);
  final tokenEndpoint =
      Uri.parse('${AppSettings.REACT_APP_RIDS_AUTH_URL}/token');
  final identifier = AppSettings.REACT_APP_RIDS_AUTHORIZE_CLIENT_ID;
  final secret = ''; // Add your client secret if required
  final redirectUrl =
      Uri.parse('your-redirect-uri'); // Replace with your redirect URI
  final scopes = AppSettings.REACT_APP_RIDS_AUTHORIZE_SCOPE.split(' ');

  oauth2.Client? _client;

  AuthService();

  Future<void> authenticate() async {
    var grant = oauth2.AuthorizationCodeGrant(
      identifier,
      authorizationEndpoint,
      tokenEndpoint,
      secret: secret,
    );

    // Redirect to the authorization URL
    var authorizationUrl =
        grant.getAuthorizationUrl(redirectUrl, scopes: scopes);
    print('Open the following URL in your browser: $authorizationUrl');

    // Listen for the redirection on the redirect URL
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
    final request = await server.first;

    final queryParams = request.uri.queryParameters;
    if (queryParams.containsKey('error')) {
      print('Authorization error: ${queryParams['error']}');
      return;
    }

    final authorizationResponse = request.uri.queryParameters;
    await request.response.close();
    await server.close();

    // Use the authorization response to obtain credentials
    _client = await grant.handleAuthorizationResponse(authorizationResponse);

    // Handle successful authentication
    print('Authentication successful: ${_client!.credentials.accessToken}');
  }

  Future<void> refreshToken() async {
    if (_client == null) {
      print('No client found. Authenticate first.');
      return;
    }

    try {
      _client = await _client!.refreshCredentials();

      // Handle successful token refresh
      print('Token refreshed: ${_client!.credentials.accessToken}');
    } catch (e) {
      // Handle token refresh error
      print('Token refresh error: $e');
    }
  }

  Future<void> endSession() async {
    if (_client == null) {
      print('No client found. Authenticate first.');
      return;
    }

    try {
      // await _client!.revokeCredentials();

      // Handle successful session end
      print('Session ended');
    } catch (e) {
      // Handle session end error
      print('Session end error: $e');
    }
  }
}
