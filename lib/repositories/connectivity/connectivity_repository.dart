import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:covid_app/repositories/connectivity/abstract_connectivity_repository.dart';

class ConnectivityRepository implements IConnectivityRepository {
  @override
  Stream<ConnectivityResult> getConnectivityStream() =>
      Connectivity().onConnectivityChanged;
}
