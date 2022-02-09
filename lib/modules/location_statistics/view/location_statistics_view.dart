import 'package:covid_app/api_client/api_client.dart';
import 'package:covid_app/configs/colors.dart';
import 'package:covid_app/modules/global_statistics/bloc/global_statistics_bloc.dart';
import 'package:covid_app/modules/location_statistics/bloc/location_statistics_bloc.dart';
import 'package:covid_app/modules/location_statistics/widgets/local_buttons.dart';
import 'package:covid_app/repositories/countries/abstract_countries_repository.dart';
import 'package:covid_app/repositories/statistics/abstract_statistics_repository.dart';
import 'package:covid_app/widgets/stat_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationStatisticsView extends StatelessWidget {
  const LocationStatisticsView({Key? key}) : super(key: key);

  String _getProvidedCountry(context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return (arguments as Map)['country'];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = LocationStatisticsBloc(
          client: context.read<ApiClient>().client,
          countriesRepository: context.read<ICountriesRepository>(),
          statisticsRepository: context.read<IStatisticsRepository>(),
        );
        bloc.add(Init(countrySlug: _getProvidedCountry(context)));
        return bloc;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 17,
              vertical: kToolbarHeight * .5,
            ),
            child: Center(
              child:
                  BlocBuilder<LocationStatisticsBloc, LocationStatisticsState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(
                                Icons.arrow_back_rounded,
                                color: white,
                                size: 27,
                              ),
                            ),
                          ),
                          Align(
                            child: Text(
                              state.countryName ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(fontSize: 26),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      StatChart(
                        data: state.loadingStatus == LoadingStatus.done
                            ? state.statToShow
                            : null,
                      ),
                      const Spacer(),
                      const LocalButtons(),
                      const Spacer(),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
