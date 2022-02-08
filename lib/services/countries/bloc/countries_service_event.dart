part of 'countries_service_bloc.dart';

abstract class CountriesServiceEvent extends Equatable {
  const CountriesServiceEvent();

  @override
  List<Object> get props => [];
}

class LoadCountries extends CountriesServiceEvent {}

class CountrySearched extends CountriesServiceEvent {
  final String searchedItem;

  const CountrySearched(this.searchedItem);

  @override
  List<Object> get props => [searchedItem];
}
