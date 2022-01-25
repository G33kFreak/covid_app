part of 'connectivity_bloc.dart';

enum ConnectionStatus {
  connected,
  unknown,
  disconnected,
}

class ConnectivityState extends Equatable {
  final ConnectionStatus status;

  const ConnectivityState._({this.status = ConnectionStatus.unknown});

  const ConnectivityState.unknown() : this._();

  const ConnectivityState.connected()
      : this._(status: ConnectionStatus.connected);

  const ConnectivityState.disconnected()
      : this._(status: ConnectionStatus.disconnected);

  @override
  List<Object?> get props => [status];
}
