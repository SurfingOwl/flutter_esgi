import 'package:dio/dio.dart';

class Http {
  static Dio getApi() {
    return Dio(
      BaseOptions(baseUrl: "https://xoc1-kd2t-7p9b.n7c.xano.io/api:xbcc5VEi"),
    );
  }
}

enum Status {
  initial,
  loading,
  success,
  error,
}
