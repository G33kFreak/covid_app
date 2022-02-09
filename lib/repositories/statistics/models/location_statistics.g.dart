// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationStatistics _$LocationStatisticsFromJson(Map<String, dynamic> json) =>
    LocationStatistics(
      confirmed: json['Confirmed'] as int,
      deaths: json['Deaths'] as int,
      recovered: json['Recovered'] as int,
      active: json['Active'] as int,
    );

Map<String, dynamic> _$LocationStatisticsToJson(LocationStatistics instance) =>
    <String, dynamic>{
      'Confirmed': instance.confirmed,
      'Deaths': instance.deaths,
      'Recovered': instance.recovered,
      'Active': instance.active,
    };
