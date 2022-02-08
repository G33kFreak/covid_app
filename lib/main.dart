import 'dart:async';

import 'package:covid_app/configs/colors.dart';
import 'package:covid_app/configs/text_theme.dart';
import 'package:covid_app/routes/routes.dart';
import 'package:covid_app/services/bloc_observer/app_bloc_observer.dart';
import 'package:covid_app/services/services_wrapper/services_provider.dart';
import 'package:covid_app/services/services_wrapper/services_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runZonedGuarded(
      () async {
        BlocOverrides.runZoned(
          () => runApp(MyApp()),
          blocObserver: AppBlocObserver.instance(),
        );
      },
      (error, stackTrace) {},
    );

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ServicesProvider(
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        routes: Routes.getRoutes(context),
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(primary: white),
          textTheme: textTheme,
          backgroundColor: background,
          scaffoldBackgroundColor: background,
        ),
        builder: (context, child) => ServicesWrapper(
          child: child!,
          navigatorKey: _navigatorKey,
        ),
      ),
    );
  }
}
