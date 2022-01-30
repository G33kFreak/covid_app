import 'package:covid_app/api_client/api_client.dart';
import 'package:covid_app/modules/global_statistics/bloc/global_statistics_bloc.dart';
import 'package:covid_app/modules/global_statistics/widgets/global_buttons.dart';
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
        );

        bloc.add(InitGlobalStat());
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
    );
  }
}
