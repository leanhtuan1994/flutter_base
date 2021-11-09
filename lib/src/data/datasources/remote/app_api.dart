import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart';

part 'app_api.g.dart';

@RestApi()
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;
}
