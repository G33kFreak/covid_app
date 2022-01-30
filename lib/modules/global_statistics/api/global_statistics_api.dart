import 'package:covid_app/modules/global_statistics/models/global_range_stat.dart';
import 'package:covid_app/modules/global_statistics/models/global_statistics.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GlobalStatisticsApi {
  static Future<GlobalStatistics> getGlobalStatistics(Dio client) async {
    final response = await client.get('/summary');
    return GlobalStatistics.fromJson(response.data['Global']);
  }

  static Future<GlobalRangeStat> getGlobalRangeStat(
    Dio client, {
    required DateTime from,
    required DateTime to,
  }) async {
    final response = await client.get(
      '/world',
      queryParameters: {
        'from': DateUtils.dateOnly(from),
        'to': DateUtils.dateOnly(to),
      },
    );

    return GlobalRangeStat.fromJson(response.data);
  }
}
