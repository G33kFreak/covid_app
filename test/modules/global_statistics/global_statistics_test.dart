import 'package:bloc_test/bloc_test.dart';
import 'package:covid_app/modules/global_statistics/bloc/global_statistics_bloc.dart';
import 'package:covid_app/repositories/statistics/abstract_statistics_repository.dart';
import 'package:covid_app/repositories/statistics/models/global_range_stat.dart';
import 'package:covid_app/repositories/statistics/models/global_statistics.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'global_statistics_test.mocks.dart';

@GenerateMocks([IStatisticsRepository, Dio, GlobalStatistics, GlobalRangeStat])
void main() {
  final statisticsRepository = MockIStatisticsRepository();
  final dio = MockDio();
  final globalStatistics = MockGlobalStatistics();
  final rangeStatistics = MockGlobalRangeStat();
  blocTest<GlobalStatisticsBloc, GlobalStatisticsState>(
    'Init and changing selected stat type in GlobalStatisticsBloc',
    setUp: () {
      when(statisticsRepository.getGlobalStatistics(dio))
          .thenAnswer((_) => Future.value(globalStatistics));
      when(statisticsRepository.getGlobalRangeStat(dio,
              from: anyNamed('from'), to: anyNamed('to')))
          .thenAnswer((_) => Future.value(rangeStatistics));
      when(rangeStatistics.statistics).thenReturn([
        globalStatistics,
        globalStatistics,
        globalStatistics,
        globalStatistics,
        globalStatistics,
        globalStatistics,
        globalStatistics
      ]);
      when(globalStatistics.newConfirmed).thenReturn(0);
      when(globalStatistics.newDeaths).thenReturn(0);
      when(globalStatistics.newRecovered).thenReturn(0);
      when(globalStatistics.totalConfirmed).thenReturn(0);
      when(globalStatistics.totalDeaths).thenReturn(0);
      when(globalStatistics.totalRecovered).thenReturn(0);
    },
    build: () => GlobalStatisticsBloc(
      client: dio,
      statisticsRepository: statisticsRepository,
    ),
    wait: const Duration(milliseconds: 400),
    act: (bloc) => bloc
      ..add(InitGlobalStat())
      ..add(const ChangedSelectedType(StatType.totalDeaths))
      ..add(const ChangedSelectedType(StatType.totalRecovered))
      ..add(const ChangedSelectedType(StatType.newConfirmed))
      ..add(const ChangedSelectedType(StatType.newDeaths))
      ..add(const ChangedSelectedType(StatType.newRecovered)),
    expect: () => <GlobalStatisticsState>[
      const GlobalStatisticsState(
        loadingStatus: LoadingStatus.loading,
        statToShow: [0, 0, 0, 0, 0, 0, 0],
        selectedStat: StatType.totalDeaths,
      ),
      GlobalStatisticsState(
        statistics: globalStatistics,
        rangeStat: rangeStatistics,
        loadingStatus: LoadingStatus.done,
        statToShow: const [0, 0, 0, 0, 0, 0, 0],
        selectedStat: StatType.totalDeaths,
      ),
      GlobalStatisticsState(
        statistics: globalStatistics,
        rangeStat: rangeStatistics,
        loadingStatus: LoadingStatus.done,
        statToShow: const [0, 0, 0, 0, 0, 0, 0],
        selectedStat: StatType.totalRecovered,
      ),
      GlobalStatisticsState(
        statistics: globalStatistics,
        rangeStat: rangeStatistics,
        loadingStatus: LoadingStatus.done,
        statToShow: const [0, 0, 0, 0, 0, 0, 0],
        selectedStat: StatType.newConfirmed,
      ),
      GlobalStatisticsState(
        statistics: globalStatistics,
        rangeStat: rangeStatistics,
        loadingStatus: LoadingStatus.done,
        statToShow: const [0, 0, 0, 0, 0, 0, 0],
        selectedStat: StatType.newDeaths,
      ),
      GlobalStatisticsState(
        statistics: globalStatistics,
        rangeStat: rangeStatistics,
        loadingStatus: LoadingStatus.done,
        statToShow: const [0, 0, 0, 0, 0, 0, 0],
        selectedStat: StatType.newRecovered,
      )
    ],
  );
}
