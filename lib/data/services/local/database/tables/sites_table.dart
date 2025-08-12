import 'dart:convert';
import 'package:drift/drift.dart';

import '../../../../../domain/models/news/news.dart';

class SitesTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get iconUrl => text()();
  DateTimeColumn get updateTime => dateTime()();
  TextColumn get news => text().map(const NewsListConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

class NewsListConverter extends TypeConverter<List<News>, String> {
  const NewsListConverter();

  @override
  List<News> fromSql(String fromDb) {
    final list = jsonDecode(fromDb) as List;
    return list.map((e) => News.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  String toSql(List<News> value) {
    return jsonEncode(value.map((e) => e.toJson()).toList());
  }
}
