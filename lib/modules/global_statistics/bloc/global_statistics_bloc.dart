import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'global_statistics_event.dart';
part 'global_statistics_state.dart';

class GlobalStatisticsBloc extends Bloc<GlobalStatisticsEvent, GlobalStatisticsState> {
  GlobalStatisticsBloc() : super(GlobalStatisticsInitial()) {
    on<GlobalStatisticsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
