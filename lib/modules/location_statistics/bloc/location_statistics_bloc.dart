import 'package:bloc/bloc.dart';
import 'package:covid_app/modules/global_statistics/bloc/global_statistics_bloc.dart';
import 'package:covid_app/modules/location_statistics/utils/utils.dart';
import 'package:covid_app/repositories/countries/abstract_countries_repository.dart';
import 'package:covid_app/repositories/statistics/abstract_statistics_repository.dart';
import 'package:covid_app/repositories/statistics/models/location_statistics.dart';
import 'package:covid_app/utils/logger.dart';
import 'package:covid_app/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'location_statistics_event.dart';
part 'location_statistics_state.dart';

class LocationStatisticsBloc
    extends Bloc<LocationStatisticsEvent, LocationStatisticsState> {
  final ICountriesRepository countriesRepository;
  final IStatisticsRepository statisticsRepository;
  final Dio client;

  LocationStatisticsBloc({
    required this.client,
    required this.countriesRepository,
    required this.statisticsRepository,
  }) : super(const LocationStatisticsState()) {
    on<Init>(_onInit);
    on<ChangedSelectedType>(_onChangedType);
  }

  void _onChangedType(
    ChangedSelectedType event,
    Emitter<LocationStatisticsState> emit,
  ) {
    emit(
      state.copyWith(
        statToShow: LocalStatUtils.getRangeStat(
          state.rangeStatistics,
          event.selectedType,
        ),
        selectedStat: event.selectedType,
      ),
    );
  }

  Future<void> _onInit(
    Init event,
    Emitter<LocationStatisticsState> emit,
  ) async {
    final country = countriesRepository.loadedCountries!
        .firstWhere((c) => c.slug == event.countrySlug);

    emit(state.copyWith(countryName: country.country));
    try {
      final statistics = await statisticsRepository.getLocationStatistics(
        client,
        country: country.slug,
        from: Utils.getFromDate(),
        to: Utils.getToDate(),
      );
      LocationStatistics summaryStat = LocationStatistics(
        confirmed: 0,
        deaths: 0,
        recovered: 0,
        active: 0,
      );

      for (final stat in statistics) {
        summaryStat = summaryStat.copyWith(
          confirmed: summaryStat.confirmed + stat.confirmed,
          deaths: summaryStat.deaths + stat.deaths,
          recovered: summaryStat.recovered + stat.recovered,
          active: summaryStat.active + stat.active,
        );
      }

      emit(
        state.copyWith(
          rangeStatistics: statistics,
          statistics: summaryStat,
          statToShow: LocalStatUtils.getRangeStat(
            statistics,
            state.selectedStat,
          ),
          loadingStatus: LoadingStatus.done,
        ),
      );
    } on DioError catch (e) {
      logger.e('DioError', e);
    } catch (e) {
      logger.e('Uncaught error', e);
    }
  }
}
