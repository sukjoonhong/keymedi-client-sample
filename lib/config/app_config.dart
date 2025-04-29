import 'dart:io';

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();
  static bool _isInitialized = false;

  AppConfig._internal();

  factory AppConfig() => _instance;

  late final String androidBackendEndpoint;
  late final String iosBackendEndpoint;
  late final String environment;

  void initialize({
    required String androidBackendEndpoint,
    required String iosBackendEndpoint,
    required String environment,
  }) {
    if (_isInitialized) return;
    _isInitialized = true;

    this.androidBackendEndpoint = androidBackendEndpoint;
    this.iosBackendEndpoint = iosBackendEndpoint;
    this.environment = environment;
  }

  String getBackendEndpoint() {
    if (Platform.isAndroid) {
      return androidBackendEndpoint;
    } else if (Platform.isIOS) {
      return iosBackendEndpoint;
    } else {
      throw Exception('Host not defined for platform');
    }
  }
}