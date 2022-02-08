part of 'countries_service_bloc.dart';

class CountriesServiceState extends Equatable {
  final LoadingStatus countriesLoadingStatus;
  final String? searchingCountry;
  final List<Country>? matchedCountries;

  const CountriesServiceState({
    this.countriesLoadingStatus = LoadingStatus.loading,
    this.searchingCountry,
    this.matchedCountries,
  });

  CountriesServiceState copyWith({
    LoadingStatus? countriesLoadingStatus,
    String? searchingCountry,
    List<Country>? matchedCountries,
  }) =>
      CountriesServiceState(
        countriesLoadingStatus:
            countriesLoadingStatus ?? this.countriesLoadingStatus,
        searchingCountry: searchingCountry ?? this.searchingCountry,
        matchedCountries: matchedCountries ?? this.matchedCountries,
      );

  @override
  List<Object?> get props => [
        countriesLoadingStatus,
        searchingCountry,
        matchedCountries,
      ];
}
