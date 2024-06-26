// app_settings.dart
class AppSettings {
  static const String BASE_APP_URL = "https://hrpsaasdev.ramcouat.com";
  static const String BASE_APP_NAME = "app";
  static const String RIDS_AUTH_URL = "$BASE_APP_URL/coresecurityops";
  static const String RIDS_AUTH_CLIENTID = "com.ramco.nebula.clients";
  static const String RIDS_AUTH_SCOPE = "openid rvw_impersonate offline_access";
  static const String CALLBACK_URL = "$BASE_APP_URL/$BASE_APP_NAME/callback";
}
