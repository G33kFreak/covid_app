import 'package:json_annotation/json_annotation.dart';

part 'global_statistics.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class GlobalStatistics {
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;
  final DateTime? date;

  GlobalStatistics({
    required this.newConfirmed,
    required this.totalConfirmed,
    required this.newDeaths,
    required this.totalDeaths,
    required this.newRecovered,
    required this.totalRecovered,
    this.date,
  });

  factory GlobalStatistics.fromJson(Map<String, dynamic> json) =>
      _$GlobalStatisticsFromJson(json);
  Map<String, dynamic> toJson() => _$GlobalStatisticsToJson(this);
}
