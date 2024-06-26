import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:nebula_modelling/services/oAuth2_Config.dart';

class OidcClient {
  final String authority;
  final String clientId;
  final String redirectUri;
  final String responseType;
  final String scope;
  final String postLogoutRedirectUri;
  String? codeVerifier;

  OidcClient({
    required this.authority,
    required this.clientId,
    required this.redirectUri,
    required this.responseType,
    required this.scope,
    required this.postLogoutRedirectUri,
  });

  String _generateCodeVerifier() {
    final random = Random.secure();
    final values = List<int>.generate(32, (i) => random.nextInt(256));
    return base64Url.encode(values).replaceAll('=', '');
  }

  String _generateCodeChallenge(String verifier) {
    final bytes = utf8.encode(verifier);
    final digest = sha256.convert(bytes);
    return base64Url.encode(digest.bytes).replaceAll('=', '');
  }

  Future<void> signInRedirect() async {
    codeVerifier = _generateCodeVerifier();
    final codeChallenge = _generateCodeChallenge(codeVerifier!);
    final state =
        _generateCodeVerifier(); // use the same method for state generation

    final authUrl =
        Uri.parse('$authorizationEndpoint').replace(queryParameters: {
      'client_id': clientId,
      'redirect_uri': redirectUri,
      'response_type': responseType,
      'scope': scope,
      'state': state,
      'code_challenge': codeChallenge,
      'code_challenge_method': 'S256',
      'response_mode': 'query',
    }).toString();

    print('Authentication URL: $authUrl');

    try {
      final result = await FlutterWebAuth.authenticate(
        url: authUrl,
        callbackUrlScheme: Uri.parse(redirectUri).scheme,
      );

      print('Callback URL: $result');
      await handleCallback(result);
    } catch (e) {
      print('Authentication error: $e');
    }
  }

  Future<Map<String, dynamic>> handleCallback(String callbackUrl) async {
    final code = Uri.parse(callbackUrl).queryParameters['code'];
    if (code == null) {
      throw Exception('Authorization code not found');
    }

    final tokenResponse = await http.post(
      Uri.parse(tokenEndpoint),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': redirectUri,
        'client_id': clientId,
        'code_verifier': codeVerifier,
      },
    );

    if (tokenResponse.statusCode != 200) {
      throw Exception('Failed to retrieve token');
    }

    print('Token response: ${tokenResponse.body}');
    return json.decode(tokenResponse.body);
  }

  Future<void> signOutRedirect() async {
    final logoutUrl =
        Uri.parse('$authority/connect/endsession').replace(queryParameters: {
      'post_logout_redirect_uri': postLogoutRedirectUri,
    }).toString();

    await FlutterWebAuth.authenticate(
      url: logoutUrl,
      callbackUrlScheme: Uri.parse(postLogoutRedirectUri).scheme,
    );
  }
}

final oidcClient = OidcClient(
  authority: 'https://hrpsaasdev.ramcouat.com/coresecurityops',
  clientId: clientId,
  redirectUri: redirectUrl,
  responseType: 'code',
  scope: scopes.join(' '),
  postLogoutRedirectUri: '${getBaseUrl()}/$baseAppName',
);

// // oidc_client.dart
// import 'package:flutter_web_auth/flutter_web_auth.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:math';
// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:crypto/crypto.dart';
// import 'app_settings.dart';

// class OidcClient {
//   final String authority;
//   final String clientId;
//   final String redirectUri;
//   final String responseType;
//   final String scope;
//   final String postLogoutRedirectUri;
//   String? codeVerifier;

//   OidcClient({
//     required this.authority,
//     required this.clientId,
//     required this.redirectUri,
//     required this.responseType,
//     required this.scope,
//     required this.postLogoutRedirectUri,
//   });

//   String _generateCodeVerifier() {
//     final random = Random.secure();
//     final values = List<int>.generate(32, (i) => random.nextInt(256));
//     return base64Url.encode(values).replaceAll('=', '');
//   }

//   String _generateCodeChallenge(String verifier) {
//     final bytes = utf8.encode(verifier);
//     final digest = sha256.convert(bytes);
//     return base64Url.encode(digest.bytes).replaceAll('=', '');
//   }

//   Future<void> signInRedirect() async {
//     codeVerifier = _generateCodeVerifier();
//     final codeChallenge = _generateCodeChallenge(codeVerifier!);
//     final state =
//         _generateCodeVerifier(); // use the same method for state generation

//     final authUrl =
//         Uri.parse('$authority/connect/authorize').replace(queryParameters: {
//       'client_id': clientId,
//       'redirect_uri': redirectUri,
//       'response_type': responseType,
//       'scope': scope,
//       'state': state,
//       'code_challenge': codeChallenge,
//       'code_challenge_method': 'S256',
//       'response_mode': 'query',
//     }).toString();

//     print('Authentication URL: $authUrl');

//     try {
//       final result = await FlutterWebAuth.authenticate(
//         url: authUrl,
//         callbackUrlScheme: Uri.parse(redirectUri).scheme,
//       );

//       print('Callback URL: $result');
//       await handleCallback(result);
//     } catch (e) {
//       print('Authentication error: $e');
//     }
//   }

//   Future<Map<String, dynamic>> handleCallback(String callbackUrl) async {
//     final code = Uri.parse(callbackUrl).queryParameters['code'];
//     if (code == null) {
//       throw Exception('Authorization code not found');
//     }

//     final tokenResponse = await http.post(
//       Uri.parse('$authority/connect/token'),
//       headers: {'Content-Type': 'application/x-www-form-urlencoded'},
//       body: {
//         'grant_type': 'authorization_code',
//         'code': code,
//         'redirect_uri': redirectUri,
//         'client_id': clientId,
//         'code_verifier': codeVerifier,
//       },
//     );

//     if (tokenResponse.statusCode != 200) {
//       throw Exception('Failed to retrieve token');
//     }

//     print('Token response: ${tokenResponse.body}');
//     return json.decode(tokenResponse.body);
//   }

//   Future<void> signOutRedirect() async {
//     final logoutUrl =
//         Uri.parse('$authority/connect/endsession').replace(queryParameters: {
//       'post_logout_redirect_uri': postLogoutRedirectUri,
//     }).toString();

//     await FlutterWebAuth.authenticate(
//       url: logoutUrl,
//       callbackUrlScheme: Uri.parse(postLogoutRedirectUri).scheme,
//     );
//   }
// }
