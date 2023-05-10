abstract class Session {
  String? get accessToken;

  String get authorization;

  int get timeout;

  bool validate(int code);
}
