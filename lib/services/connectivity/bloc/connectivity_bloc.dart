import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  late StreamSubscription<ConnectivityResult> _connectionStatusSubscription;

  ConnectivityBloc() : super(const ConnectivityState.unknown()) {
    on<ConnectionStatusChanged>(_onStatusChanged);
    _connectionStatusSubscription = Connectivity().onConnectivityChanged.listen(
          _connectionListener,
        );
  }

  void _connectionListener(ConnectivityResult result) {
    add(ConnectionStatusChanged(connectionState: result));
  }

  void _onStatusChanged(
    ConnectionStatusChanged event,
    Emitter<ConnectivityState> emit,
  ) {
    if (event.connectionState == ConnectivityResult.none) {
      emit(const ConnectivityState.disconnected());
    } else {
      emit(const ConnectivityState.connected());
    }
  }

  @override
  Future<void> close() {
    _connectionStatusSubscription.cancel();
    return super.close();
  }
}
