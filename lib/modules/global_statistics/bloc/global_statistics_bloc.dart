import 'package:bloc/bloc.dart';
import 'package:covid_app/modules/global_statistics/utils/utils.dart';
import 'package:covid_app/repositories/statistics/abstract_statistics_repository.dart';
import 'package:covid_app/repositories/statistics/models/global_range_stat.dart';
import 'package:covid_app/repositories/statistics/models/global_statistics.dart';
import 'package:covid_app/utils/logger.dart';
import 'package:covid_app/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'global_statistics_event.dart';
part 'global_statistics_state.dart';

class GlobalStatisticsBloc
    extends Bloc<GlobalStatisticsEvent, GlobalStatisticsState> {
  final Dio client;
  final IStatisticsRepository statisticsRepository;

  GlobalStatisticsBloc({
    required this.client,
    required this.statisticsRepository,
  }) : super(const GlobalStatisticsState()) {
    on<InitGlobalStat>(_onInit);
    on<ChangedSelectedType>(_onChangedSelectedType);
  }

  void _onChangedSelectedType(
    ChangedSelectedType event,
    Emitter<GlobalStatisticsState> emit,
  ) {
    emit(state.copyWith(
      selectedStat: event.newSelectedStat,
      statToShow: GlobalStatUtils.getRangeStat(
        state.rangeStat,
        event.newSelectedStat,
      ),
    ));
  }

  Future<void> _onInit(
    InitGlobalStat event,
    Emitter<GlobalStatisticsState> emit,
  ) async {
    try {
      final stat = await statisticsRepository.getGlobalStatistics(client);
      final rangeStat = await statisticsRepository.getGlobalRangeStat(
        client,
        from: Utils.getFromDate(),
        to: Utils.getToDate(),
      );

      emit(
        state.copyWith(
          statistics: stat,
          rangeStat: rangeStat,
          loadingStatus: LoadingStatus.done,
          statToShow: GlobalStatUtils.getRangeStat(
            rangeStat,
            state.selectedStat,
          ),
        ),
      );
    } on DioError catch (e) {
      logger.e('DioError', e);
    } catch (e) {
      logger.e('Uncaught error', e);
    }
  }
}
