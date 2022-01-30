import 'package:covid_app/widgets/stat_chart.dart';
import 'package:flutter/material.dart';

class GlobalStatisticsView extends StatelessWidget {
  const GlobalStatisticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 17,
            vertical: kToolbarHeight * .5,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Global',
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                StatChart(),
                const Spacer(flex: 5)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
