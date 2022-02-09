import 'package:covid_app/modules/global_statistics/view/global_statistics_view.dart';
import 'package:covid_app/modules/location_statistics/view/location_statistics_view.dart';
import 'package:covid_app/modules/no_connection/no_connection.dart';
import 'package:covid_app/modules/splash/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splash = '/';
  static const String noConnection = '/noConnection';
  static const String globalStatistics = '/global';
  static const String locationStatistics = '/location';

  static Map<String, Widget Function(BuildContext)> getRoutes(context) => {
        splash: (context) => const SplashView(),
        globalStatistics: (context) => const GlobalStatisticsView(),
        noConnection: (context) => const NoConnection(),
        locationStatistics: (context) => const LocationStatisticsView(),
      };
}
