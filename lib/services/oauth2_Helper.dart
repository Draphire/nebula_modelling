// oauth2_helper.dart
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'oauth2_config.dart';

class OAuth2Helper {
  Future<Map<String, dynamic>> authenticateUser() async {
    // Construct the authorization URL
    final authUrl = Uri.parse(authorizationEndpoint).replace(queryParameters: {
      'client_id': clientId,
      'redirect_uri': redirectUrl,
      'response_type': 'code',
      'scope': scopes.join(' '),
    });

    // Open the authentication URL in an external browser and get the redirected URL
    final result = await FlutterWebAuth.authenticate(
      url: authUrl.toString(),
      callbackUrlScheme: Uri.parse(redirectUrl).scheme,
    );

    // Extract the authorization code from the redirected URL
    final code = Uri.parse(result).queryParameters['code'];

    if (code == null) {
      throw Exception('Authorization code not found');
    }

    // Exchange the authorization code for an access token
    final tokenResponse = await http.post(
      Uri.parse(tokenEndpoint),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': redirectUrl,
        'client_id': clientId,
      },
    );

    if (tokenResponse.statusCode != 200) {
      throw Exception('Failed to retrieve token');
    }

    return json.decode(tokenResponse.body);
  }
}
