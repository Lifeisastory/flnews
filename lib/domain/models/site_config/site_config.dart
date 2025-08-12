

import 'package:freezed_annotation/freezed_annotation.dart';

import '../news_xpath/news_xpath.dart';

part 'site_config.freezed.dart';
part 'site_config.g.dart';

@freezed
class SiteConfig with _$SiteConfig {
  const factory SiteConfig({
    required int id,
    required int sort,
    required String name,
    required String host,
    required bool isSubscribed,
    required int delay,
    required String url,
    required String iconUrl,
    required NewsXpath newsXpath,
  }) = _SiteConfig;

  factory SiteConfig.fromJson(Map<String, dynamic> json) => _$SiteConfigFromJson(json);
}