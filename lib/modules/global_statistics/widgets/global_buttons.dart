import 'package:covid_app/modules/global_statistics/bloc/global_statistics_bloc.dart';
import 'package:covid_app/widgets/stat_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalButtons extends StatelessWidget {
  const GlobalButtons({Key? key}) : super(key: key);

  void _onButtonTap(BuildContext context, StatType statType) {
    context.read<GlobalStatisticsBloc>().add(ChangedSelectedType(statType));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalStatisticsBloc, GlobalStatisticsState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: StatButton(
                    label: 'Total Confirmed',
                    data: state.statistics?.totalConfirmed,
                    onTap: () => _onButtonTap(context, StatType.totalConfirmed),
                    isSelected: state.selectedStat == StatType.totalConfirmed,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: StatButton(
                    label: 'Total Recovered',
                    data: state.statistics?.totalRecovered,
                    onTap: () => _onButtonTap(context, StatType.totalRecovered),
                    isSelected: state.selectedStat == StatType.totalRecovered,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: StatButton(
                    label: 'Total Deaths',
                    data: state.statistics?.totalDeaths,
                    onTap: () => _onButtonTap(context, StatType.totalDeaths),
                    isSelected: state.selectedStat == StatType.totalDeaths,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: StatButton(
                    label: 'New Confirmed',
                    data: state.statistics?.newConfirmed,
                    onTap: () => _onButtonTap(context, StatType.newConfirmed),
                    isSelected: state.selectedStat == StatType.newConfirmed,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: StatButton(
                    label: 'New Recovered',
                    data: state.statistics?.newRecovered,
                    onTap: () => _onButtonTap(context, StatType.newRecovered),
                    isSelected: state.selectedStat == StatType.newRecovered,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: StatButton(
                    label: 'New Deaths',
                    data: state.statistics?.newDeaths,
                    onTap: () => _onButtonTap(context, StatType.newDeaths),
                    isSelected: state.selectedStat == StatType.newDeaths,
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
