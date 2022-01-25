import 'package:dio/dio.dart';

import 'dio_error.dart';

class BaseDio {
  BaseDio._();

  static BaseDio? _instance;

  static BaseDio? getInstance() {
    _instance ??= BaseDio._();

    return _instance;
  }

  Dio getDio() {
    final Dio dio = Dio();
    dio.options = BaseOptions(receiveTimeout: 10000, connectTimeout: 10000);
    return dio;
  }

  DiosError getDioError(Object obj) {
    switch (obj.runtimeType) {
      case DioError:
        final response = (obj as DioError).response;
        return DiosError(
          code: response?.statusCode,
          message: response?.data,
        );
      default:
        break;
    }

    return DiosError(message: "something went wrong");
  }
}
