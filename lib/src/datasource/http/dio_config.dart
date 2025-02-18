import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:millearnia/src/core/environment.dart';

final _logInterceptor = LogInterceptor(
  logPrint: (object) => log(object.toString()),
  request: true,
  requestHeader: true,
  requestBody: true,
  responseBody: true,
);

class DioConfig {
  final Dio dio;

  DioConfig({Dio? dio})
      : dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: Environment.baseUrl,
                headers: {
                  'Accept': 'application/json',
                  'local':'fr',
                },
                contentType: 'application/json',
                // connectTimeout: Duration(milliseconds: 10000), // 10 secondes
                // receiveTimeout: 10000,
              ),
            ) {
    this.dio.interceptors.add(_logInterceptor);
  }
}
