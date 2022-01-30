import 'package:dio/dio.dart';

class GlobalStatisticsApi {
  static Future<void> getGlobalStatistics(Dio client) async {
    final response = await client.get('/summary');
  }
}
