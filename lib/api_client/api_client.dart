import 'package:covid_app/configs/env.dart';
import 'package:dio/dio.dart';

class ApiClient {
  Dio get client => _getApiClient();

  Dio _getApiClient() {
    Dio client = Dio(BaseOptions(baseUrl: Env.apiBase));
    return client;
  }
}
