import 'app_config.dart';

class ApiEndpoints {
  static final String baseUrl = "http://${AppConfig().getBackendEndpoint()}";

  static final AuthEndpoints auth = AuthEndpoints();
  static final MemberEndpoints member = MemberEndpoints();
  static final MatchingEndpoints matching = MatchingEndpoints();
}

class AuthEndpoints {
  final String _base = "${ApiEndpoints.baseUrl}/auth";

  String get publicKey => "$_base/public-key";

  String get login => "$_base/login";

  String get register => "$_base/register";

  String get refresh => "$_base/refresh";
}

class MemberEndpoints {
  final String _base = "${ApiEndpoints.baseUrl}/member";
}

class MatchingEndpoints {
  final String _base = "${ApiEndpoints.baseUrl}/matching";

  String get baseUrl => _base;

  String get requests => "$_base/requests";
}
