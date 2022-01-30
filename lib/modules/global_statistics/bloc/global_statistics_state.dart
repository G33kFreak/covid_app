part of 'global_statistics_bloc.dart';

enum LoadingStatus { loading, done }

enum StatType {
  newConfirmed,
  totalConfirmed,
  newDeaths,
  totalDeaths,
  newRecovered,
  totalRecovered,
}

class GlobalStatisticsState extends Equatable {
  final GlobalStatistics? statistics;
  final GlobalRangeStat? rangeStat;
  final LoadingStatus loadingStatus;
  final StatType selectedStat;
  final List<int>? statToShow;

  const GlobalStatisticsState({
    this.statistics,
    this.rangeStat,
    this.loadingStatus = LoadingStatus.loading,
    this.selectedStat = StatType.totalConfirmed,
    this.statToShow,
  });

  GlobalStatisticsState copyWith({
    GlobalStatistics? statistics,
    GlobalRangeStat? rangeStat,
    LoadingStatus? loadingStatus,
    StatType? selectedStat,
    List<int>? statToShow,
  }) =>
      GlobalStatisticsState(
        statistics: statistics ?? this.statistics,
        rangeStat: rangeStat ?? this.rangeStat,
        loadingStatus: loadingStatus ?? this.loadingStatus,
        selectedStat: selectedStat ?? this.selectedStat,
        statToShow: statToShow,
      );

  @override
  List<Object?> get props => [
        statistics,
        rangeStat,
        loadingStatus,
        selectedStat,
        statToShow,
      ];
}
