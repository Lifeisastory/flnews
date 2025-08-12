import 'dart:convert';
import 'package:drift/drift.dart';

import '../../../../../domain/models/news_xpath/news_xpath.dart';

class SitesConfigTable extends Table {
  IntColumn get id => integer()();
  IntColumn get sort => integer()();
  TextColumn get name => text()();
  TextColumn get host => text()();
  BoolColumn get isSubscribed => boolean()();
  IntColumn get delay => integer()();
  TextColumn get url => text()();
  TextColumn get iconUrl => text()();
  TextColumn get newsXpath => text().map(const NewsXpathConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

class NewsXpathConverter extends TypeConverter<NewsXpath, String> {
  const NewsXpathConverter();

  @override
  NewsXpath fromSql(String fromDb) {
    return NewsXpath.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(NewsXpath value) {
    return jsonEncode(value.toJson());
  }
}
