import 'dart:io';

import 'package:dio/dio.dart';
import 'package:esim_mob_app/core/utils/logger/logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class Api {
  //Host for API requests to dev server
  //static const baseUrl = 'https://slonova-dev.pp.ua/api/';
  //Host for API requests to production server
  static const baseUrl = 'https://app.christinaslonova.com/api/';

  // static const baseUrl = 'http://localhost:4001/api/';

  Api() {
    _dio = Dio(_options())
      ..interceptors.addAll([dioLogger, wrapper()]);
  }

  late final Dio _dio;

  Dio get dio => _dio;

  String? _token;
  String? _guid;

  set guid(String? value) {
    _guid = value;

    if (value != null && value.isNotEmpty) {
      _dio.options = _changeGuidInOptions(_guid!);
    } else {
      _dio.options.headers.remove('user-guid');
    }
  }

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
        if (_guid != null && _guid!.isNotEmpty) 'user-guid': _guid!,
      },
    );
  }

  BaseOptions _changeGuidInOptions(String newGuid) {
    return _dio.options.copyWith(
      headers: {
        'user-guid': newGuid,
        if (_token != null && _token!.isNotEmpty) HttpHeaders.authorizationHeader: 'Bearer $_token',
      },
    );
  }

  final dioLogger = TalkerDioLogger(
    talker: Logger.instance,
    settings: const TalkerDioLoggerSettings(),
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
