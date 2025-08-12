import 'package:flutter/material.dart';

import '../../../utils/command.dart';
import '../../../utils/result.dart';
import '../../../data/repositories/site_config/site_config_repository.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel({required SiteConfigRepository siteConfigRepository})
    : _siteConfigRepository = siteConfigRepository {
    load = Command0(_load)..execute();
  }

  final SiteConfigRepository _siteConfigRepository;

  late Command0 load;

  Future<Result> _load() async {
    return Result.ok(null);
  }

  void restoreSitesConfig() async {
    await _siteConfigRepository.resetSitesConfigTable();
  }
}
