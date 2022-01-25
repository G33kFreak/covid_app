import 'package:covid_app/modules/splash/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splash = '/';
  static const String noConnection = '/noConnection';
  static const String main = '/main';

  static Map<String, Widget Function(BuildContext)> getRoutes(context) => {
        splash: (context) => const SplashView(),
      };
}