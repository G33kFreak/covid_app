import 'package:geocode/geocode.dart';

abstract class ILocationRepository {
  Future<Coordinates> getCoordinates();

  Future<String?> getCountryByCoordinates(Coordinates coordinates);
}
