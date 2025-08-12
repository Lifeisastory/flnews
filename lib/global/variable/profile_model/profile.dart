import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  Profile();
  String? locale;
  String? darkMode;
  num? theme;
  int? hotCounts;
  double? fontSize;
  bool? isWebViewOn;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
