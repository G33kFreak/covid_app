import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:covid_app/repositories/connectivity/abstract_connectivity_repository.dart';
import 'package:covid_app/services/connectivity/bloc/connectivity_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'connectivity_service_test.mocks.dart';

@GenerateMocks([IConnectivityRepository])
void main() {
  final IConnectivityRepository _mockConnectivityRepository =
      MockIConnectivityRepository();
  blocTest<ConnectivityBloc, ConnectivityState>(
    'ConnectivityState changes on switching network provider',
    setUp: () {
      when(_mockConnectivityRepository.getConnectivityStream()).thenAnswer(
        (_) => Stream.fromIterable([
          ConnectivityResult.wifi,
          ConnectivityResult.none,
          ConnectivityResult.mobile,
        ]),
      );
    },
    build: () => ConnectivityBloc(
      connectivityRepository: _mockConnectivityRepository,
    ),
    expect: () => const <ConnectivityState>[
      ConnectivityState.connected(),
      ConnectivityState.disconnected(),
      ConnectivityState.connected(),
    ],
  );
}
