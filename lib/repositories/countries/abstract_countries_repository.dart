import 'package:covid_app/repositories/countries/models/country.dart';
import 'package:dio/dio.dart';

abstract class ICountriesRepository {
  List<Country>? get loadedCountries;
  set loadedCountries(List<Country>? countries);

  Future<List<Country>> getCountries(Dio client);

  String getCountrySlug(String countryName);
}
