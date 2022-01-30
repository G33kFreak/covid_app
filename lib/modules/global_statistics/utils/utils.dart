import 'package:covid_app/modules/global_statistics/bloc/global_statistics_bloc.dart';
import 'package:covid_app/repositories/statistics/models/global_range_stat.dart';

class GlobalStatUtils {
  static List<int> getRangeStat(
    GlobalRangeStat rangeStat,
    StatType selectedType,
  ) {
    final stats = rangeStat.statistics;

    switch (selectedType) {
      case StatType.newConfirmed:
        return stats.map((e) => e.newConfirmed).toList();
      case StatType.newDeaths:
        return stats.map((e) => e.newDeaths).toList();
      case StatType.newRecovered:
        return stats.map((e) => e.newRecovered).toList();
      case StatType.totalConfirmed:
        return stats.map((e) => e.totalConfirmed).toList();
      case StatType.totalDeaths:
        return stats.map((e) => e.totalDeaths).toList();
      case StatType.totalRecovered:
        return stats.map((e) => e.totalRecovered).toList();
    }
  }
}
