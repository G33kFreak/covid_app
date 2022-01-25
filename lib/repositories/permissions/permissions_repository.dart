import 'package:covid_app/repositories/permissions/abstract_permissions_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsRepository implements IPermissionsRepository {
  @override
  Future<bool> isLocationPermissionGranted() async =>
      Permission.location.isGranted;

  @override
  Future<bool> askForLocationPermission() async {
    final newStatus = await Permission.location.request();

    if (newStatus == PermissionStatus.granted) {
      return true;
    }

    return false;
  }
}
