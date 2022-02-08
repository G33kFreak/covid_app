import 'package:bloc/bloc.dart';
import 'package:covid_app/modules/global_statistics/bloc/global_statistics_bloc.dart';
import 'package:covid_app/repositories/countries/abstract_countries_repository.dart';
import 'package:covid_app/repositories/countries/models/country.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'countries_service_event.dart';
part 'countries_service_state.dart';

class CountriesServiceBloc
    extends Bloc<CountriesServiceEvent, CountriesServiceState> {
  final ICountriesRepository countriesRepository;
  final Dio client;
  CountriesServiceBloc({
    required this.countriesRepository,
    required this.client,
  }) : super(const CountriesServiceState()) {
    on<LoadCountries>(_loadCountries);
    on<CountrySearched>(_onCountrySearched);
  }

  Future<void> _loadCountries(
    LoadCountries event,
    Emitter<CountriesServiceState> emit,
  ) async {
    emit(state.copyWith(countriesLoadingStatus: LoadingStatus.loading));
    if (countriesRepository.loadedCountries == null) {
      final countries = await countriesRepository.getCountries(client);
      countriesRepository.loadedCountries = countries;
    }
    emit(state.copyWith(countriesLoadingStatus: LoadingStatus.done));
  }

  void _onCountrySearched(
    CountrySearched event,
    Emitter<CountriesServiceState> emit,
  ) {
    if (event.searchedItem.isNotEmpty) {
      final matchedCountries = countriesRepository.loadedCountries
          ?.where(
            (c) => c.country
                .toLowerCase()
                .contains(event.searchedItem.toLowerCase()),
          )
          .toList();
      emit(state.copyWith(
          matchedCountries: matchedCountries,
          searchingCountry: event.searchedItem));
    } else {
      emit(state.copyWith(
          matchedCountries: countriesRepository.loadedCountries,
          searchingCountry: event.searchedItem));
    }
  }
}
