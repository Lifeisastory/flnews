// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiteConfigImpl _$$SiteConfigImplFromJson(Map<String, dynamic> json) =>
    _$SiteConfigImpl(
      id: (json['id'] as num).toInt(),
      sort: (json['sort'] as num).toInt(),
      name: json['name'] as String,
      host: json['host'] as String,
      isSubscribed: json['isSubscribed'] as bool,
      delay: (json['delay'] as num).toInt(),
      url: json['url'] as String,
      iconUrl: json['iconUrl'] as String,
      newsXpath: NewsXpath.fromJson(json['newsXpath'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SiteConfigImplToJson(_$SiteConfigImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sort': instance.sort,
      'name': instance.name,
      'host': instance.host,
      'isSubscribed': instance.isSubscribed,
      'delay': instance.delay,
      'url': instance.url,
      'iconUrl': instance.iconUrl,
      'newsXpath': instance.newsXpath,
    };
