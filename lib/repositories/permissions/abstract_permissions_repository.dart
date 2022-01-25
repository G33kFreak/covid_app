abstract class IPermissionsRepository {
  Future<bool> isLocationPermissionGranted();

  Future<bool> askForLocationPermission();
}
