import 'package:covid_app/configs/env.dart';
import 'package:covid_app/repositories/location/abstract_location_repository.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepository implements ILocationRepository {
  @override
  Future<Coordinates> getCoordinates() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    final coordinates = Coordinates(
      latitude: position.latitude,
      longitude: position.longitude,
    );
    return coordinates;
  }

  @override
  Future<String?> getCountryByCoordinates(Coordinates coordinates) async {
    final address = await GeoCode(apiKey: Env.geocodeApiKey).reverseGeocoding(
      latitude: coordinates.latitude!,
      longitude: coordinates.longitude!,
    );

    return address.countryName;
  }
}
