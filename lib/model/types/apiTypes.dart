abstract class ApiClient {
  final String baseUrl;
  final Map<String, String> headers;
  dynamic authToken;

  ApiClient({
    required this.baseUrl,
    required this.headers,
  });

  Future<String> authClientCredentials({
    required String authorizationEndpoint,
    required String identifier,
    required String clientSecret,
  });

  Future<dynamic> get(String endpoint, {Map<String, String>? headers});
  Future<dynamic> post(String endpoint,
      {required Map<String, dynamic> body, Map<String, String>? headers});
  Future<dynamic> put(String endpoint,
      {required Map<String, dynamic> body, Map<String, String>? headers});
  Future<dynamic> patch(String endpoint,
      {required Map<String, dynamic> body, Map<String, String>? headers});
  Future<dynamic> delete(String endpoint, {Map<String, String>? headers});
}
