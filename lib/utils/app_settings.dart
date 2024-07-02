// app_settings.dart

import 'package:universal_html/html.dart' as html;

String getBaseUrl() {
  final uri = html.window.location;
  if (uri.hostname!.contains('localhost')) {
    return 'http://localhost:${uri.port}';
  }
  return '${uri.protocol}//${uri.host}';
}

const baseAppName = 'app'; // Adjust according to your app settings
final redirectUrl = '${getBaseUrl()}/$baseAppName/callback';

const authorizationEndpoint =
    'https://hrpsaasdev.ramcouat.com/coresecurityops/connect/authorize';
const tokenEndpoint =
    'https://hrpsaasdev.ramcouat.com/coresecurityops/connect/token';
const clientId = 'com.ramco.nebula.clients';
const scopes = ['openid', 'rvw_impersonate', 'offline_access'];

class AppSettings {
//   String getBaseUrl() {
//   final uri = html.window.location;
//   if (uri.hostname!.contains('localhost')) {
//     return 'http://localhost:${uri.port}';
//   }
//   return '${uri.protocol}//${uri.host}';
// }

  static const String BASE_APP_URL = "https://hrpsaasdev.ramcouat.com";
  static const String BASE_APP_NAME = "app";
  static const String RIDS_AUTH_URL = "$BASE_APP_URL/coresecurityops";
  static const String RIDS_AUTH_CLIENTID = "com.ramco.nebula.clients";
  static const String RIDS_AUTH_SCOPE = "openid rvw_impersonate offline_access";
  static final String CALLBACK_URL = '${getBaseUrl()}/$BASE_APP_NAME/callback';
  // static final String CALLBACK_URL = '${getBaseUrl()}/$BASE_APP_NAME/callback';
  // static const String CALLBACK_URL = "$BASE_APP_URL/$BASE_APP_NAME/callback";
}
