import 'package:covid_app/utils/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  factory AppBlocObserver.instance() => _singleton ??= AppBlocObserver._();
  static AppBlocObserver? _singleton;
  AppBlocObserver._();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.d('${bloc.runtimeType}()');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.d('${bloc.runtimeType}.add(${event.runtimeType})');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e('${bloc.runtimeType}', error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    logger.d('${bloc.runtimeType}.close()');
    super.onClose(bloc);
  }
}
