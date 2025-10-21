
abstract interface class FcmTokenStorage {
  Future<void> saveFcmToken(String token);

  Future<String?> getFcmToken();

  Future<void> deleteFcmToken();
}