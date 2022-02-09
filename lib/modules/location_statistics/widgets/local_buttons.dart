import 'package:covid_app/modules/location_statistics/bloc/location_statistics_bloc.dart';
import 'package:covid_app/widgets/stat_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalButtons extends StatelessWidget {
  const LocalButtons({Key? key}) : super(key: key);

  void _onButtonTap(BuildContext context, LocalStatType statType) {
    context.read<LocationStatisticsBloc>().add(ChangedSelectedType(statType));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationStatisticsBloc, LocationStatisticsState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: StatButton(
                    label: 'Active',
                    data: state.statistics?.active,
                    onTap: () => _onButtonTap(context, LocalStatType.active),
                    isSelected: state.selectedStat == LocalStatType.active,
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: StatButton(
                    label: 'Confirmed',
                    data: state.statistics?.confirmed,
                    onTap: () => _onButtonTap(context, LocalStatType.confirmed),
                    isSelected: state.selectedStat == LocalStatType.confirmed,
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(flex: 2),
                Expanded(
                  flex: 3,
                  child: StatButton(
                    label: 'Recovered',
                    data: state.statistics?.recovered,
                    onTap: () => _onButtonTap(context, LocalStatType.recovered),
                    isSelected: state.selectedStat == LocalStatType.recovered,
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: StatButton(
                    label: 'Deaths',
                    data: state.statistics?.deaths,
                    onTap: () => _onButtonTap(context, LocalStatType.deaths),
                    isSelected: state.selectedStat == LocalStatType.deaths,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
