import 'package:covid_app/modules/location_statistics/bloc/location_statistics_bloc.dart';
import 'package:covid_app/repositories/statistics/models/location_statistics.dart';

class LocalStatUtils {
  static List<int> getRangeStat(
    List<LocationStatistics>? rangeStat,
    LocalStatType selectedType,
  ) {
    if (rangeStat != null) {
      switch (selectedType) {
        case LocalStatType.active:
          return rangeStat.map((e) => e.active).toList();
        case LocalStatType.confirmed:
          return rangeStat.map((e) => e.confirmed).toList();
        case LocalStatType.deaths:
          return rangeStat.map((e) => e.deaths).toList();
        case LocalStatType.recovered:
          return rangeStat.map((e) => e.recovered).toList();
      }
    } else {
      return [for (int i = 0; i < 7; i++) 0];
    }
  }
}
