part of 'location_statistics_bloc.dart';

enum LocalStatType {
  confirmed,
  deaths,
  recovered,
  active,
}

class LocationStatisticsState extends Equatable {
  final String? countryName;
  final List<LocationStatistics>? rangeStatistics;
  final LocationStatistics? statistics;
  final LoadingStatus loadingStatus;
  final List<int>? statToShow;
  final LocalStatType selectedStat;

  const LocationStatisticsState({
    this.countryName,
    this.rangeStatistics,
    this.statistics,
    this.loadingStatus = LoadingStatus.loading,
    this.statToShow,
    this.selectedStat = LocalStatType.active,
  });

  LocationStatisticsState copyWith({
    String? countryName,
    List<LocationStatistics>? rangeStatistics,
    LocationStatistics? statistics,
    LoadingStatus? loadingStatus,
    List<int>? statToShow,
    LocalStatType? selectedStat,
  }) =>
      LocationStatisticsState(
        countryName: countryName ?? this.countryName,
        rangeStatistics: rangeStatistics ?? this.rangeStatistics,
        statistics: statistics ?? this.statistics,
        loadingStatus: loadingStatus ?? this.loadingStatus,
        statToShow: statToShow ?? this.statToShow,
        selectedStat: selectedStat ?? this.selectedStat,
      );

  @override
  List<Object?> get props => [
        countryName,
        rangeStatistics,
        statistics,
        loadingStatus,
        statToShow,
        selectedStat,
      ];
}
