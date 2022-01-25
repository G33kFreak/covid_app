import 'package:covid_app/routes/routes.dart';
import 'package:covid_app/services/services_wrapper/services_provider.dart';
import 'package:covid_app/services/services_wrapper/services_wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

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
          primarySwatch: Colors.blue,
        ),
        builder: (context, child) => ServicesWrapper(
          child: child!,
          navigatorKey: _navigatorKey,
        ),
      ),
    );
  }
}
