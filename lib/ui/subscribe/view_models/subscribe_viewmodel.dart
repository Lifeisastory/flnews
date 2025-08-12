import 'package:flutter/material.dart';

import '../../../data/repositories/site/site_repository.dart';
import '../../../data/repositories/site_config/site_config_repository.dart';
import '../../../domain/models/site_config/site_config.dart';
// import '../../../utils/command.dart';
// import '../../../utils/result.dart';

class SubscribeViewModel extends ChangeNotifier {
  SubscribeViewModel({
    required SiteConfigRepository siteConfigRepository,
    required SiteRepository siteRepository,
  }) : _siteConfigRepository = siteConfigRepository,
       _siteRepository = siteRepository;

  final SiteConfigRepository _siteConfigRepository;
  final SiteRepository _siteRepository;

  Stream<List<SiteConfig>> get sitesConfigStream =>
      _siteConfigRepository.watchSitesConfig();

  void switchSubscription({required int id, required bool isSubscribed}) async {
    await _siteConfigRepository.switchSitesSubscription(
      id: id,
      isSubscribed: isSubscribed,
    );
   await _siteRepository.getSites(id: id);
  }
}
