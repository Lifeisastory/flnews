// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsImpl _$$NewsImplFromJson(Map<String, dynamic> json) => _$NewsImpl(
  siteId: (json['siteId'] as num).toInt(),
  siteName: json['siteName'] as String,
  siteIconUrl: json['siteIconUrl'] as String,
  position: (json['position'] as num).toInt(),
  title: json['title'] as String,
  url: json['url'] as String,
  imageUrl: json['imageUrl'] as String?,
  popularity: json['popularity'] as String,
);

Map<String, dynamic> _$$NewsImplToJson(_$NewsImpl instance) =>
    <String, dynamic>{
      'siteId': instance.siteId,
      'siteName': instance.siteName,
      'siteIconUrl': instance.siteIconUrl,
      'position': instance.position,
      'title': instance.title,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
      'popularity': instance.popularity,
    };
