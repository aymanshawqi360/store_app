import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiFactore {
  ApiFactore._();
  static Dio? dio;
  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.receiveTimeout = timeOut
        ..options.connectTimeout = timeOut;
      getDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void getDioInterceptor() {
    dio!.interceptors.add(PrettyDioLogger(
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
  }
}
