import 'package:covid_app/repositories/statistics/models/location_statistics.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LocationStatisticsApi {
  static Future<List<LocationStatistics>> getCountryStatistics(
    Dio client, {
    required String country,
    required DateTime from,
    required DateTime to,
  }) async {
    final response = await client.get(
      '/country/$country',
      queryParameters: {
        'from': DateUtils.dateOnly(from),
        'to': DateUtils.dateOnly(to),
      },
    );

    return (response.data as List)
        .map((e) => LocationStatistics.fromJson(e))
        .toList();
  }
}
