// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiteImpl _$$SiteImplFromJson(Map<String, dynamic> json) => _$SiteImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  iconUrl: json['iconUrl'] as String,
  updateTime: DateTime.parse(json['updateTime'] as String),
  news:
      (json['news'] as List<dynamic>)
          .map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$SiteImplToJson(_$SiteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
      'updateTime': instance.updateTime.toIso8601String(),
      'news': instance.news,
    };
