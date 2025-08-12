import 'package:flnews/utils/result.dart';

import '../../../domain/models/site_config/site_config.dart';
import '../../services/local/local_database_service.dart';

class SiteConfigRepository {
  SiteConfigRepository({required LocalDatabaseService localDatabaseSvc})
    : _localDatabaseSvc = localDatabaseSvc;

  final LocalDatabaseService _localDatabaseSvc;

  Future<Result<List<SiteConfig>>> getSitesConfig() async {
    var sitesConfig = await _localDatabaseSvc.retrieveSitesConfigTable();
    return Result.ok(sitesConfig);
  }

  Future<int> switchSitesSubscription({
    required int id,
    required bool isSubscribed,
  }) async {
    return await _localDatabaseSvc.switchSubscriptionSitesConfigTable(
      id: id,
      isSubscribed: isSubscribed,
    );
  }

  Stream<List<SiteConfig>> watchSitesConfig() {
    return _localDatabaseSvc.watchSitesConfigTable();
  }

  Future<void> resetSitesConfigTable() async {
    await _localDatabaseSvc.resetSitesConfigTable();
  }
}
