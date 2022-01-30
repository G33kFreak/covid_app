import 'package:covid_app/repositories/statistics/models/global_range_stat.dart';
import 'package:covid_app/repositories/statistics/models/global_statistics.dart';
import 'package:dio/dio.dart';

abstract class IStatisticsRepository {
  Future<GlobalStatistics> getGlobalStatistics(Dio client);

  Future<GlobalRangeStat> getGlobalRangeStat(
    Dio client, {
    required DateTime from,
    required DateTime to,
  });
}
