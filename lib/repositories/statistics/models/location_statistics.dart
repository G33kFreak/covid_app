import 'package:json_annotation/json_annotation.dart';

part 'location_statistics.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class LocationStatistics {
  final int confirmed;
  final int deaths;
  final int recovered;
  final int active;

  LocationStatistics({
    required this.confirmed,
    required this.deaths,
    required this.recovered,
    required this.active,
  });

  LocationStatistics copyWith({
    int? confirmed,
    int? deaths,
    int? recovered,
    int? active,
  }) =>
      LocationStatistics(
        confirmed: confirmed ?? this.confirmed,
        deaths: deaths ?? this.deaths,
        recovered: recovered ?? this.recovered,
        active: active ?? this.active,
      );

  factory LocationStatistics.fromJson(Map<String, dynamic> json) =>
      _$LocationStatisticsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationStatisticsToJson(this);
}
