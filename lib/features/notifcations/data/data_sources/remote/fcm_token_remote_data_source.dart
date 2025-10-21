

///@RestApi(baseUrl: RestApi.baseUrl)
class FcmTokenRemoteDataSource {
  // factory FcmTokenRemoteDataSource(Dio dio, {String? baseUrl}) = _FcmTokenRemoteDataSource;

  //@POST('/fcm-tokens')
  Future<void> sendToken({required final Map<String, dynamic> body,}) async {
    await Future.delayed(const Duration(milliseconds: 1400));
  }

  //@DELETE('/fcm-tokens/{token}')
  Future<void> deleteToken({required final String token,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1400));
  }
}
