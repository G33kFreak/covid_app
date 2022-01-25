part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object> get props => [];
}

class ConnectionStatusChanged extends ConnectivityEvent {
  final ConnectivityResult connectionState;

  const ConnectionStatusChanged({required this.connectionState});

  @override
  List<Object> get props => [connectionState];
}
