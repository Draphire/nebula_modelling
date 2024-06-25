class AppSettings {
  static const String APP_VERSION = '1.1.1';
  static const String REACT_APP_APP_SETTINGS_VERSION = '3.0.0';
  static final String REACT_APP_BASE_APP_URL = getAppUrl();
  static final String REACT_APP_MOCK_API_URL = getMockApiUrl();
  static final String REACT_APP_API_URL = '${getGatewayUrl()}/coreapiops';
  static final String REACT_APP_RIDS_AUTH_URL =
      '${getGatewayUrl()}/coresecurityops';
  static const String REACT_APP_RIDS_AUTHORIZE_CLIENT_ID =
      'com.ramco.nebula.clients';
  static const String REACT_APP_BACKEND_MODE = 'both';
  static const String REACT_APP_RIDS_AUTHORIZE_SCOPE =
      'openid rvw_impersonate offline_access';
  static const String REACT_APP_OPENREPLAY_PROJECT_ID = 'rEbvxU9Fowung1KtwjZk';
  static const String REACT_APP_OPENREPLAY_INGEST_POINT =
      'https://analytics.ramcouat.com/ingest';
  static const bool REACT_APP_ENABLE_LOGGING = true;
  static const String REACT_APP_BASE_APP_NAME = 'app';

  static String getAppUrl() {
    return getBaseUrl();
  }

  static String getMockApiUrl() {
    if (getBaseUrl().contains('localhost')) {
      return 'http://localhost:3000';
    }
    return '${getBaseUrl()}/coregwops/mock';
  }

  static String getGatewayUrl() {
    return 'https://hrpsaasdev.ramcouat.com';
  }

  static String getBaseUrl() {
    if (Uri.base.host.contains('localhost') && Uri.base.port == 3000) {
      return 'http://localhost:3000';
    }
    return '${Uri.base.scheme}://${Uri.base.host}';
  }
}
