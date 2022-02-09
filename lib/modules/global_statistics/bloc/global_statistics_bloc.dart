import 'package:bloc/bloc.dart';
import 'package:covid_app/modules/global_statistics/utils/utils.dart';
import 'package:covid_app/repositories/countries/abstract_countries_repository.dart';
import 'package:covid_app/repositories/location/abstract_location_repository.dart';
import 'package:covid_app/repositories/permissions/abstract_permissions_repository.dart';
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
  final IPermissionsRepository permissionsRepository;
  final ILocationRepository locationRepository;
  final ICountriesRepository countriesRepository;

  GlobalStatisticsBloc({
    required this.client,
    required this.statisticsRepository,
    required this.permissionsRepository,
    required this.locationRepository,
    required this.countriesRepository,
  }) : super(const GlobalStatisticsState()) {
    on<InitGlobalStat>(_onInit);
    on<ChangedSelectedType>(_onChangedSelectedType);
    on<RequestedMyLocation>(_onLocationRequested);
    on<NavigatedByLocation>(_onNavigatedByLocation);
  }

  Future<void> _onLocationRequested(
    RequestedMyLocation event,
    Emitter<GlobalStatisticsState> emit,
  ) async {
    emit(state.copyWith(locationLoadingStatus: LoadingStatus.loading));
    bool isPermissionGranded =
        await permissionsRepository.isLocationPermissionGranted();

    if (!isPermissionGranded) {
      isPermissionGranded =
          await permissionsRepository.askForLocationPermission();
    }

    if (isPermissionGranded) {
      final myLocation = await locationRepository.getCoordinates();
      final country =
          await locationRepository.getCountryByCoordinates(myLocation);
      final countrySlug = countriesRepository.getCountrySlug(country!);
      emit(state.copyWith(
        locationLoadingStatus: LoadingStatus.done,
        locationCountry: countrySlug,
      ));
    } else {
      emit(state.copyWith(locationLoadingStatus: LoadingStatus.done));
    }
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

  void _onNavigatedByLocation(
    NavigatedByLocation event,
    Emitter<GlobalStatisticsState> emit,
  ) {
    emit(state.setLocationAsNull());
  }
}
