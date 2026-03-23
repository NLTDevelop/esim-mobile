import 'dart:io';

import 'package:dio/dio.dart';
import 'package:esim_mob_app/core/managers/auth_event_bus.dart';
import 'package:esim_mob_app/core/utils/logger/logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class AwinstApi {

  //Host for API requests to development server
  // dev
  static const baseUrl = 'https://awinstconnect.108labs.co.ua/api/';

  // prod
  //static const baseUrl = 'https://awinstconnect.com/api/';

  AwinstApi() {
    _dio = Dio(_options())
      ..interceptors.addAll([dioLogger,  InterceptorsWrapper(
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            await _handleUnauthorized();
          }

          handler.next(error);
        },
      ) ,wrapper()]);
  }

  late final Dio _dio;

  Dio get dio => _dio;

  String? _token;

  set token(String? value) {
    _token = value;
    // if (_token != null) injector<SessionStorage>().saveAccessToken(_token!);

    if (value != null && value.isNotEmpty) {
      _dio.options = _changeTokenInOptions(_token!);
    } else {
      _dio.options.headers.remove(HttpHeaders.authorizationHeader);
    }
  }

  BaseOptions _changeTokenInOptions(String newToken) {
    return _dio.options.copyWith(
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $newToken',
        'operating-system': '${Platform.operatingSystem} ${Platform.operatingSystemVersion}',
      },
    );
  }

  // BaseOptions _changeGuidInOptions(String newGuid) {
  //   return _dio.options.copyWith(
  //     headers: {
  //       'user-guid': newGuid,
  //       if (_token != null && _token!.isNotEmpty) HttpHeaders.authorizationHeader: 'Bearer $_token',
  //     },
  //   );
  // }

  Future<void> _handleUnauthorized() async {
    // await injector<SessionStorage>().cleanSession();

    AuthEventBus.instance.logout();
  }

  final dioLogger = TalkerDioLogger(
    talker: Logger.instance,
    settings: const TalkerDioLoggerSettings(printRequestHeaders: true),
  );

  BaseOptions _options() => BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 16),
    receiveTimeout: const Duration(seconds: 16),
    sendTimeout: const Duration(seconds: 16),
  );

  QueuedInterceptorsWrapper wrapper() => QueuedInterceptorsWrapper(
    onRequest: (options, handler) {
      return handler.next(options);
    },
    onResponse: (response, handler) async {
      return handler.next(response);
    },
    onError: (error, handler) async {
      return handler.next(error);
    },
  );
}
