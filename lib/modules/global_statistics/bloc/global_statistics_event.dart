part of 'global_statistics_bloc.dart';

abstract class GlobalStatisticsEvent extends Equatable {
  const GlobalStatisticsEvent();

  @override
  List<Object> get props => [];
}

class InitGlobalStat extends GlobalStatisticsEvent {}

class ChangedSelectedType extends GlobalStatisticsEvent {
  final StatType newSelectedStat;

  const ChangedSelectedType(this.newSelectedStat);

  @override
  List<Object> get props => [newSelectedStat];
}

class RequestedMyLocation extends GlobalStatisticsEvent {}
