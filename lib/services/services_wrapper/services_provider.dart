import 'package:covid_app/services/connectivity/bloc/connectivity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesProvider extends StatelessWidget {
  final Widget child;

  const ServicesProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ConnectivityBloc(),
        ),
      ],
      child: child,
    );
  }
}
