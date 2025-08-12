// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_xpath.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsXpathImpl _$$NewsXpathImplFromJson(Map<String, dynamic> json) =>
    _$NewsXpathImpl(
      position: json['position'] as String?,
      title: json['title'] as String,
      url: json['url'] as String,
      popularity: json['popularity'] as String,
      imageUrl: json['imageUrl'] as String?,
      parameter: json['parameter'] as String?,
    );

Map<String, dynamic> _$$NewsXpathImplToJson(_$NewsXpathImpl instance) =>
    <String, dynamic>{
      'position': instance.position,
      'title': instance.title,
      'url': instance.url,
      'popularity': instance.popularity,
      'imageUrl': instance.imageUrl,
      'parameter': instance.parameter,
    };
