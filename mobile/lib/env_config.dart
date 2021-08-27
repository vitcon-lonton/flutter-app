enum Mode { dev, stag, prod }

class EnvConfig {
  static const APP_MODE =
      String.fromEnvironment('APP_MODE', defaultValue: 'development');
  static const APP_NAME = String.fromEnvironment('APP_NAME');
  static const APP_SUFFIX = String.fromEnvironment('APP_SUFFIX');

  static Mode get mode {
    if (APP_MODE == 'staging') return Mode.stag;
    if (APP_MODE == 'production') return Mode.prod;
    return Mode.dev;
  }

  static String get DOMAIN {
    if (mode == Mode.stag) return 'https://apidemo.aqbooking.com/api/v1.0/';
    if (mode == Mode.prod) return 'https://api.aqbooking.com/api/v1.0/';
    return 'http://103.97.125.19:100/api/v1.0/';
  }
}
