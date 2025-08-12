import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:flutter/services.dart';

import 'database/db/database.dart';
import '../../../domain/models/site_config/site_config.dart';
import '../../../domain/models/site/site.dart';

class LocalDatabaseService {
  LocalDatabaseService({required AppDatabase databaseSvc})
    : _databaseSvc = databaseSvc;

  final AppDatabase _databaseSvc;

  Future<void> resetSitesConfigTable() async {
    final localSitesConfig = await rootBundle.loadString(
      'assets/xpath_config.json',
    );
    final jsonList =
        (jsonDecode(localSitesConfig) as List).cast<Map<String, dynamic>>();
    for (final item in jsonList) {
      final config = SiteConfig.fromJson(item);
      await _databaseSvc
          .into(_databaseSvc.sitesConfigTable)
          .insertOnConflictUpdate(
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

  Future<List<SiteConfig>> retrieveSitesConfigTable() async {
    var rawList =
        await _databaseSvc.select(_databaseSvc.sitesConfigTable).get();
    return rawList
        .map(
          (e) => SiteConfig(
            id: e.id,
            sort: e.sort,
            name: e.name,
            host: e.host,
            isSubscribed: e.isSubscribed,
            delay: e.delay,
            url: e.url,
            iconUrl: e.iconUrl,
            newsXpath: e.newsXpath,
          ),
        )
        .toList();
  }

  Future<List<SiteConfig>> retrieveSubscribedSitesConfigTable() async {
    var rawList =
        await (_databaseSvc.select(_databaseSvc.sitesConfigTable)
          ..where((t) => t.isSubscribed.equals(true))).get();
    return rawList
        .map(
          (e) => SiteConfig(
            id: e.id,
            sort: e.sort,
            name: e.name,
            host: e.host,
            isSubscribed: e.isSubscribed,
            delay: e.delay,
            url: e.url,
            iconUrl: e.iconUrl,
            newsXpath: e.newsXpath,
          ),
        )
        .toList();
  }

  // 流式查询
  Stream<List<SiteConfig>> watchSitesConfigTable() {
    return _databaseSvc
        .select(_databaseSvc.sitesConfigTable)
        .watch()
        .map(
          (rows) =>
              rows
                  .map(
                    (e) => SiteConfig(
                      id: e.id,
                      sort: e.sort,
                      name: e.name,
                      host: e.host,
                      isSubscribed: e.isSubscribed,
                      delay: e.delay,
                      url: e.url,
                      iconUrl: e.iconUrl,
                      newsXpath: e.newsXpath,
                    ),
                  )
                  .toList(),
        );
  }

  Future<int> switchSubscriptionSitesConfigTable({
    required int id,
    required bool isSubscribed,
  }) async {
    return await (_databaseSvc.update(_databaseSvc.sitesConfigTable)
      ..where((t) {
        return t.id.equals(id);
      })).write(SitesConfigTableCompanion(isSubscribed: Value(!isSubscribed)));
  }

  Future<int> insertIntoSitesTable(Site siteEntity) async {
    return await _databaseSvc
        .into(_databaseSvc.sitesTable)
        .insert(
          SitesTableCompanion.insert(
            id: Value(siteEntity.id),
            name: siteEntity.name,
            iconUrl: siteEntity.iconUrl,
            updateTime: siteEntity.updateTime,
            news: siteEntity.news,
          ),
        );
  }

  // 更新插入
  Future<int> upsertsIntoSitesTable(Site siteEntity) async {
    return await _databaseSvc
        .into(_databaseSvc.sitesTable)
        .insertOnConflictUpdate(
          SitesTableCompanion.insert(
            id: Value(siteEntity.id),
            name: siteEntity.name,
            iconUrl: siteEntity.iconUrl,
            updateTime: siteEntity.updateTime,
            news: siteEntity.news,
          ),
        );
  }

  Future<List<Site>> retrieveSubscribedSitesTable() async {
    final query = _databaseSvc.select(_databaseSvc.sitesTable).join([
      innerJoin(
        _databaseSvc.sitesConfigTable,
        _databaseSvc.sitesTable.id.equalsExp(_databaseSvc.sitesConfigTable.id),
      ),
    ])..where(_databaseSvc.sitesConfigTable.isSubscribed.equals(true));

    final rows = await query.get();

    return rows.map((row) {
      final site = row.readTable(_databaseSvc.sitesTable);
      return Site(
        id: site.id,
        name: site.name,
        iconUrl: site.iconUrl,
        updateTime: site.updateTime,
        news: site.news,
      );
    }).toList();
  }
}
