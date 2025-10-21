
import 'package:esim_mob_app/features/notifcations/data/data_sources/local/fcm_token_storage.dart';
import 'package:esim_mob_app/features/notifcations/data/data_sources/remote/fcm_token_remote_data_source.dart';
import 'package:esim_mob_app/features/notifcations/domain/repository/token_repository.dart';

class TokenRepositoryImpl implements TokenRepository{
  final FcmTokenRemoteDataSource _fcmTokenRemoteDataSource;
  //final GuidStorage _guidStorage;
  final FcmTokenStorage _fcmTokenStorage;

  const TokenRepositoryImpl({
    required final FcmTokenRemoteDataSource fcmTokenRemoteDataSource,
    required final FcmTokenStorage fcmTokenStorage,
  })  : _fcmTokenRemoteDataSource = fcmTokenRemoteDataSource,
        _fcmTokenStorage = fcmTokenStorage;

  @override
  Future<void> onAuthUser() async {
    // final oldFcmToken = _fcmTokenStorage.getFcmToken();
    // if (oldFcmToken != null) await _fcmTokenRemoteDataSource.deleteToken(token: oldFcmToken);
    await _fcmTokenStorage.deleteFcmToken();
    ///final fcmToken = await FirebaseNotification().fMCToken;
    const String fcmToken = 'fcm_afgkakfjeoifjapfkae';
    await _fcmTokenStorage.saveFcmToken(fcmToken);
    await _fcmTokenRemoteDataSource.sendToken(body: {'token': fcmToken});
  }

  @override
  Future<void> onLogoutUser() async {
    // final guid = _generateGUID();
    // await _guidStorage.saveGuid(guid);
    // injector<SlonovaApi>().guid = guid;

    await _fcmTokenStorage.deleteFcmToken();
    ///final fcmToken = await FirebaseNotification().fMCToken;
    const fcmToken = 'fcm_afgkakfjeoifjapfkae';
    await _fcmTokenStorage.saveFcmToken(fcmToken);
    await _fcmTokenRemoteDataSource.sendToken(body: {'token': fcmToken});
  }

  @override
  Future<void> onOpenApp() async {
    /// guid has not need yet
    //
    // String? guid;
    // guid = _guidStorage.getGuid();
    // if (guid == null) {
    //   guid = _generateGUID();
    //   await _guidStorage.saveGuid(guid);
    // }
    // injector<SlonovaApi>().guid = guid;

    //final fcmToken = await FirebaseNotification().fMCToken;
    // fake token
    const fcmToken = 'fcm_afgkakfjeoifjapfkae';
    await _fcmTokenStorage.saveFcmToken(fcmToken);
    await _fcmTokenRemoteDataSource.sendToken(body: {'token': fcmToken});
  }


}