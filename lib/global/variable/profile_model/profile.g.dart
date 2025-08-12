// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) =>
    Profile()
      ..locale = json['locale'] as String?
      ..darkMode = json['darkMode'] as String?
      ..theme = json['theme'] as num?
      ..hotCounts = (json['hotCounts'] as num?)?.toInt()
      ..fontSize = (json['fontSize'] as num?)?.toDouble()
      ..isWebViewOn = json['isWebViewOn'] as bool?;

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
  'locale': instance.locale,
  'darkMode': instance.darkMode,
  'theme': instance.theme,
  'hotCounts': instance.hotCounts,
  'fontSize': instance.fontSize,
  'isWebViewOn': instance.isWebViewOn,
};
