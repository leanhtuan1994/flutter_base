import 'dart:async';

import 'package:dio/dio.dart';

class DioClient {
  static late Dio _dio;

  static FutureOr<Dio> setup() async {
    final options = BaseOptions(
        responseType: ResponseType.json,
        validateStatus: (status) {
          return true;
        },
        headers: {},
        //! Need change base url
        baseUrl: '');

    _dio = Dio(options);

    // TODO: Add interceptors here
    // _dio.interceptors.add();

    return _dio;
  }

  static Dio get dio => _dio;
}
