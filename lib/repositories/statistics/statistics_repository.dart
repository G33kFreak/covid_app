import 'package:covid_app/repositories/statistics/abstract_statistics_repository.dart';
import 'package:covid_app/repositories/statistics/api/global_statistics_api.dart';
import 'package:covid_app/repositories/statistics/api/location_statistics_api.dart';
import 'package:covid_app/repositories/statistics/models/global_range_stat.dart';
import 'package:covid_app/repositories/statistics/models/global_statistics.dart';
import 'package:covid_app/repositories/statistics/models/location_statistics.dart';
import 'package:dio/dio.dart';

class StatisticsRepository implements IStatisticsRepository {
  @override
  Future<GlobalRangeStat> getGlobalRangeStat(
    Dio client, {
    required DateTime from,
    required DateTime to,
  }) async {
    return await GlobalStatisticsApi.getGlobalRangeStat(
      client,
      from: from,
      to: to,
    );
  }

  @override
  Future<GlobalStatistics> getGlobalStatistics(Dio client) async {
    return await GlobalStatisticsApi.getGlobalStatistics(client);
  }

  @override
  Future<List<LocationStatistics>> getLocationStatistics(
    Dio client, {
    required String country,
    required DateTime from,
    required DateTime to,
  }) async {
    return await LocationStatisticsApi.getCountryStatistics(
      client,
      country: country,
      from: from,
      to: to,
    );
  }
}
