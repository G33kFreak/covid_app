import 'package:covid_app/api_client/api_client.dart';
import 'package:covid_app/repositories/connectivity/abstract_connectivity_repository.dart';
import 'package:covid_app/repositories/connectivity/connectivity_repository.dart';
import 'package:covid_app/repositories/countries/abstract_countries_repository.dart';
import 'package:covid_app/repositories/countries/countries_repository.dart';
import 'package:covid_app/repositories/location/abstract_location_repository.dart';
import 'package:covid_app/repositories/location/location_repository.dart';
import 'package:covid_app/repositories/permissions/abstract_permissions_repository.dart';
import 'package:covid_app/repositories/permissions/permissions_repository.dart';
import 'package:covid_app/repositories/statistics/abstract_statistics_repository.dart';
import 'package:covid_app/repositories/statistics/statistics_repository.dart';
import 'package:covid_app/services/connectivity/bloc/connectivity_bloc.dart';
import 'package:covid_app/services/countries/bloc/countries_service_bloc.dart';
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
        RepositoryProvider<ILocationRepository>(
          create: (context) => LocationRepository(),
        ),
        RepositoryProvider<ApiClient>(
          create: (context) => ApiClient(),
        ),
        RepositoryProvider<ICountriesRepository>(
          create: (context) => CountriesRepository(),
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
          BlocProvider(
            create: (context) => CountriesServiceBloc(
              client: context.read<ApiClient>().client,
              countriesRepository: context.read<ICountriesRepository>(),
            ),
          )
        ],
        child: child,
      ),
    );
  }
}
