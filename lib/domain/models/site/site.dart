
import 'package:freezed_annotation/freezed_annotation.dart';

import '../news/news.dart';

part 'site.freezed.dart';
part 'site.g.dart';

@freezed
class Site with _$Site {
  const factory Site({
    required int id,
    required String name,
    required String iconUrl,
    required DateTime updateTime,
    required List<News> news
  }) = _Site;

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
}