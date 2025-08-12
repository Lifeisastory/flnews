
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
class News with _$News {
  const factory News({
    required int siteId,
    required String siteName,
    required String siteIconUrl,
    required int position,
    required String title,
    required String url,
    required String? imageUrl,
    required String popularity,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}