import 'package:covid_app/api_client/api_client.dart';
import 'package:covid_app/repositories/connectivity/abstract_connectivity_repository.dart';
import 'package:covid_app/repositories/connectivity/connectivity_repository.dart';
import 'package:covid_app/repositories/permissions/abstract_permissions_repository.dart';
import 'package:covid_app/repositories/permissions/permissions_repository.dart';
import 'package:covid_app/repositories/statistics/abstract_statistics_repository.dart';
import 'package:covid_app/repositories/statistics/statistics_repository.dart';
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IConnectivityRepository>(
          create: (context) => ConnectivityRepository(),
        ),
        RepositoryProvider<IPermissionsRepository>(
          create: (context) => PermissionsRepository(),
        ),
        RepositoryProvider<ApiClient>(
          create: (context) => ApiClient(),
        ),
        RepositoryProvider<IStatisticsRepository>(
          create: (context) => StatisticsRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ConnectivityBloc(
              connectivityRepository: context.read<IConnectivityRepository>(),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
