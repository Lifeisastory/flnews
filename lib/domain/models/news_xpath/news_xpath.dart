
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_xpath.freezed.dart';
part 'news_xpath.g.dart';

@freezed
class NewsXpath with _$NewsXpath {
  const factory NewsXpath({
    required String? position,
    required String title,
    required String url,
    required String popularity,
    required String? imageUrl,
    required String? parameter
  }) = _NewsXpath;

  factory NewsXpath.fromJson(Map<String, dynamic> json) => _$NewsXpathFromJson(json);
}