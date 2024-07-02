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
