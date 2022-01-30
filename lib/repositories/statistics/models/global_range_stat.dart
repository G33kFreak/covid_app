import 'package:covid_app/repositories/statistics/models/global_statistics.dart';

class GlobalRangeStat {
  final List<GlobalStatistics> statistics;

  GlobalRangeStat({required this.statistics});

  factory GlobalRangeStat.fromJson(List<dynamic> json) => GlobalRangeStat(
        statistics: json
            .map((e) => GlobalStatistics.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Statistics': statistics,
      };
}
