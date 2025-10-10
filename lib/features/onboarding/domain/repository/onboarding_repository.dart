abstract interface class OnBoardingRepository {
  bool isFirstRun();

  Future<void> setFirstRun(bool isFirstRun);

  Future<void> clearFirstRun();
}
