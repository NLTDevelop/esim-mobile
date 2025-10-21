

abstract interface class TokenRepository{
  Future<void> onOpenApp();

  Future<void> onAuthUser();

  Future<void> onLogoutUser();
}
