import 'package:covid_app/routes/routes.dart';
import 'package:covid_app/services/connectivity/bloc/connectivity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesWrapper extends StatelessWidget {
  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  const ServicesWrapper({
    Key? key,
    required this.child,
    required this.navigatorKey,
  }) : super(key: key);

  Future<void> _toGlobal() async {
    await Future.delayed(const Duration(milliseconds: 800));
    navigatorKey.currentState?.pushReplacementNamed(
      Routes.globalStatistics,
    );
  }

  void _toNoConnection() {
    navigatorKey.currentState?.pushReplacementNamed(Routes.noConnection);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ConnectivityBloc, ConnectivityState>(
          listener: (context, state) async {
            if (state.status == ConnectionStatus.connected) {
              await _toGlobal();
            }
            if (state.status == ConnectionStatus.disconnected) {
              _toNoConnection();
            }
          },
        ),
      ],
      child: child,
    );
  }
}
