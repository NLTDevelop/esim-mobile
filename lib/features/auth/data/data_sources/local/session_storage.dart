abstract interface class SessionStorage {
  Future<void> saveAccessToken(String accessToken);

  Future<String?> getAccessToken();

  Future<void> cleanSession();
}
