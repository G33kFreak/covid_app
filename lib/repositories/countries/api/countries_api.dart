import 'package:covid_app/repositories/countries/models/country.dart';
import 'package:dio/dio.dart';

class CountriesApi {
  Future<List<Country>> getCountries(Dio client) async {
    final response = await client.get('/countries');

    final List<Country> countries = (response.data as List<dynamic>)
        .map((e) => Country.fromJson(e))
        .toList();

    return countries;
  }
}
