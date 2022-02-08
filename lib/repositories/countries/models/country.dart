import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class Country {
  final String country;
  final String slug;

  Country({required this.country, required this.slug});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
