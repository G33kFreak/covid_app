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
  final String? locationCountry;
  final LoadingStatus locationLoadingStatus;

  const GlobalStatisticsState({
    this.statistics,
    this.rangeStat,
    this.loadingStatus = LoadingStatus.loading,
    this.selectedStat = StatType.totalConfirmed,
    this.statToShow,
    this.locationCountry,
    this.locationLoadingStatus = LoadingStatus.done,
  });

  GlobalStatisticsState copyWith({
    GlobalStatistics? statistics,
    GlobalRangeStat? rangeStat,
    LoadingStatus? loadingStatus,
    StatType? selectedStat,
    List<int>? statToShow,
    String? locationCountry,
    LoadingStatus? locationLoadingStatus,
  }) =>
      GlobalStatisticsState(
        statistics: statistics ?? this.statistics,
        rangeStat: rangeStat ?? this.rangeStat,
        loadingStatus: loadingStatus ?? this.loadingStatus,
        selectedStat: selectedStat ?? this.selectedStat,
        statToShow: statToShow ?? this.statToShow,
        locationCountry: locationCountry ?? this.locationCountry,
        locationLoadingStatus:
            locationLoadingStatus ?? this.locationLoadingStatus,
      );

  GlobalStatisticsState setLocationAsNull() => GlobalStatisticsState(
        statistics: statistics,
        rangeStat: rangeStat,
        loadingStatus: loadingStatus,
        selectedStat: selectedStat,
        statToShow: statToShow,
        locationCountry: null,
        locationLoadingStatus: locationLoadingStatus,
      );

  @override
  List<Object?> get props => [
        statistics,
        rangeStat,
        loadingStatus,
        selectedStat,
        statToShow,
        locationCountry,
        locationLoadingStatus,
      ];
}
