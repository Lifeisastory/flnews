import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../domain/models/news/news.dart';
import '../../../../../domain/models/news_xpath/news_xpath.dart';
import '../../../../../domain/models/site_config/site_config.dart';
import '../tables/sites_config_table.dart';
import '../tables/sites_table.dart';  

part 'database.g.dart';

@DriftDatabase(tables: [SitesTable, SitesConfigTable])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    beforeOpen: (details) async {
      await _initSitesConfigTable();
    },
  );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'flnews_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  Future<void> _initSitesConfigTable() async {
    // 检查表是否为空，只在首次创建时插入
    final configs = await select(sitesConfigTable).get();
    if (configs.isEmpty) {
      // 读取本地文件并插入
      final localSitesConfig = await rootBundle.loadString(
        'assets/xpath_config.json',
      );
      final jsonList =
          (jsonDecode(localSitesConfig) as List).cast<Map<String, dynamic>>();
      for (final item in jsonList) {
        final config = SiteConfig.fromJson(item);
        await into(sitesConfigTable).insert(
          SitesConfigTableCompanion.insert(
            id: Value(config.id),
            sort: config.sort,
            name: config.name,
            host: config.host,
            isSubscribed: config.isSubscribed,
            delay: config.delay,
            url: config.url,
            iconUrl: config.iconUrl,
            newsXpath: config.newsXpath,
          ),
        );
      }
    }
  }
}
