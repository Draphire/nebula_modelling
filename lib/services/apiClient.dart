import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

const String _clientId = 'com.nebula.ramco.clients';
const String _authorizeEndpoint =
    'https://hrpsaasdemo.ramcouat.com:4602/coresecurityops/connect/authorize';
const String _tokenEndpoint =
    'https://hrpsaasdemo.ramcouat.com:4602/coresecurityops/connect/token';
const String _redirectUri = 'https://hrpsaasdemo.ramcouat.com:4602/app/saas';
const identifier = '1kxkbzzxuddqgtwtvovbw';
const _clientSecret =
    'KJkcK3DqZi6yNo8hdd1lUQsGtd0mbNN9zn0fBLI0wbVsSas6Yteif6Sp7yCoP13D';

class ApiClient {
  final String baseUrl;
  final Map<String, String> headers;
  dynamic authToken;

  ApiClient({required this.baseUrl, required this.headers});

  Future<String> authClientCredentials(
      {dynamic authorizationEndpoint =
          ('https://hrpsaasdemo.ramcouat.com:4602/coresecurityops/connect/token'),
      String identifier = identifier,
      String clientSecret = _clientSecret}) async {
    // print("came here too ${authorizationEndpoint}");
    final response =
        await http.post(Uri.parse(authorizationEndpoint), headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }, body: {
      'grant_type': 'client_credentials',
      'client_id': identifier,
      'client_secret': clientSecret
    });
    print("token");
    // print(response.statusCode);
    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['access_token'];
      // print('1-${token}');
      authToken = token;
      return token;
    } else {
      throw Exception('failed to get token');
    }
  }

  String authenticate() {
    dynamic authTokn;
    // print("came here");
    authClientCredentials().then((value) {
      // print('2-${value}');
      authToken = value;
      authTokn = value;

      // return value;
    }).catchError((error) {
      print(error);
    });
    // print(authToken.toString());
    // print('auth ${authToken}');
    return authTokn;
  }

  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    final response = await _sendRequest(endpoint, 'get', headers: headers);
    return _parseResponse(response);
  }

  Future<dynamic> post(String endpoint,
      {required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    final response = await _sendRequest(endpoint, 'post',
        body: jsonEncode(body), headers: headers);
    return _parseResponse(response);
  }

  Future<dynamic> put(String endpoint,
      {required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    final response = await _sendRequest(endpoint, 'put',
        body: jsonEncode(body), headers: headers);
    return _parseResponse(response);
  }

  Future<dynamic> patch(String endpoint,
      {required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    final response = await _sendRequest(endpoint, 'patch',
        body: jsonEncode(body), headers: headers);
    return _parseResponse(response);
  }

  Future<dynamic> delete(String endpoint,
      {Map<String, String>? headers}) async {
    final response = await _sendRequest(endpoint, 'delete', headers: headers);
    return _parseResponse(response);
  }

  Future<http.Response> _sendRequest(String endpoint, String method,
      {String? body, Map<String, String>? headers}) async {
    final client = http.Client();
    final url = Uri.parse('$baseUrl/$endpoint');
    final request = http.Request(method, url);
    request.headers.addAll(this.headers);
    if (headers != null) {
      request.headers.addAll(headers as Map<String, String>);
      request.headers.addAll({'Authorization': 'Bearer ${authToken}'});
    }
    if (body != null) {
      request.body = body;
    }
    final response = await client.send(request);
    return http.Response.fromStream(response);
  }

  dynamic _parseResponse(http.Response response) {
    final body = json.decode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return body;
    } else {
      throw Exception('Failed to load data: ${body['message']}');
    }
  }
}
