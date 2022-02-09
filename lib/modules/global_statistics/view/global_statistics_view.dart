import 'package:covid_app/api_client/api_client.dart';
import 'package:covid_app/modules/global_statistics/bloc/global_statistics_bloc.dart';
import 'package:covid_app/modules/global_statistics/widgets/global_buttons.dart';
import 'package:covid_app/modules/global_statistics/widgets/search_and_location.dart';
import 'package:covid_app/repositories/countries/abstract_countries_repository.dart';
import 'package:covid_app/repositories/location/abstract_location_repository.dart';
import 'package:covid_app/repositories/permissions/abstract_permissions_repository.dart';
import 'package:covid_app/repositories/statistics/abstract_statistics_repository.dart';
import 'package:covid_app/routes/routes.dart';
import 'package:covid_app/widgets/stat_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalStatisticsView extends StatelessWidget {
  const GlobalStatisticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = GlobalStatisticsBloc(
          client: context.read<ApiClient>().client,
          statisticsRepository: context.read<IStatisticsRepository>(),
          permissionsRepository: context.read<IPermissionsRepository>(),
          locationRepository: context.read<ILocationRepository>(),
          countriesRepository: context.read<ICountriesRepository>(),
        );

        bloc.add(InitGlobalStat());
        return bloc;
      },
      child: BlocListener<GlobalStatisticsBloc, GlobalStatisticsState>(
        listener: (context, state) {
          if (state.locationCountry != null) {
            Navigator.of(context).pushNamed(
              Routes.locationStatistics,
              arguments: {'country': state.locationCountry},
            );
            context.read<GlobalStatisticsBloc>().add(NavigatedByLocation());
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
                vertical: kToolbarHeight * .5,
              ),
              child: Center(
                child: BlocBuilder<GlobalStatisticsBloc, GlobalStatisticsState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Text(
                          'Global',
                          style: Theme.of(context).textTheme.headline2,
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                        const SearchAndLocation(),
                        const Spacer(),
                        StatChart(
                          data: state.loadingStatus == LoadingStatus.done
                              ? state.statToShow
                              : null,
                        ),
                        const Spacer(),
                        const GlobalButtons(),
                        const Spacer(),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
