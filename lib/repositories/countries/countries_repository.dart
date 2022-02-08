import 'package:covid_app/repositories/countries/abstract_countries_repository.dart';
import 'package:covid_app/repositories/countries/api/countries_api.dart';
import 'package:dio/dio.dart';
import 'package:covid_app/repositories/countries/models/country.dart';

class CountriesRepository implements ICountriesRepository {
  @override
  Future<List<Country>> getCountries(Dio client) async {
    final countries = await CountriesApi().getCountries(client);

    return countries;
  }

  @override
  List<Country>? get loadedCountries => _loadedCountries;
  List<Country>? _loadedCountries;
  @override
  set loadedCountries(List<Country>? countries) => _loadedCountries = countries;

  @override
  String getCountrySlug(String countryName) {
    final country = loadedCountries!
        .firstWhere((country) => country.country == countryName);

    return country.slug;
  }
}
