part of 'location_statistics_bloc.dart';

abstract class LocationStatisticsEvent extends Equatable {
  const LocationStatisticsEvent();

  @override
  List<Object> get props => [];
}

class Init extends LocationStatisticsEvent {
  final String countrySlug;

  const Init({required this.countrySlug});

  @override
  List<Object> get props => [countrySlug];
}

class ChangedSelectedType extends LocationStatisticsEvent {
  final LocalStatType selectedType;

  const ChangedSelectedType(this.selectedType);

  @override
  List<Object> get props => [selectedType];
}
