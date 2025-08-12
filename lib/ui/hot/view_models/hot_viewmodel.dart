import 'package:flutter/material.dart';

import '../../../data/repositories/site/site_repository.dart';
import '../../../domain/models/site/site.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';

class HotViewModel extends ChangeNotifier {
  HotViewModel({required SiteRepository siteRepository})
    : _siteRepository = siteRepository {
    load = Command1(_load)..execute(false);
    refresh = Command1(_refreshNews);
  }

  final SiteRepository _siteRepository;
  late Command1<void, bool> load;
  late Command1<void, int> refresh;

  DateTime _newsUpdateTime = DateTime.now();
  DateTime get newsUpdateTime => _newsUpdateTime;
  final _newsCount = 10;
  int get newsCount => _newsCount;
  int _siteId = 0; // 记录点击新闻卡片刷新按钮时卡片站点的id, 用于在循环创建卡片时判断哪个卡片需要加载动画
  int get siteId => _siteId;
  List<Site> _siteEntities = [];
  List<Site> get siteEntities => _siteEntities;

  Future<Result> _refreshNews(int id) async {
    try {
      _siteId = id;
      final siteEntity = await _siteRepository.getSites(id: id);    // siteEntity仍然为List，但只有一个元素
      switch (siteEntity) {
        case Ok<List<Site>>():
          for (var e in _siteEntities) {    // 找到要刷新的站点，更新其新闻列表
            if (e.id == id) {
              _siteEntities[_siteEntities.indexOf(e)] = siteEntity.value.first;
            }
          }
        case Error<List<Site>>():
          return siteEntity;
      }
    } finally {
      notifyListeners();
    }
    return Result.ok(null);
  }

  void viewMore({int? id}) {}

  void updateTime() {
    _newsUpdateTime = DateTime.now();
    notifyListeners();
  }

  /// 情况一： [isRefresh]为默认，从数据库加载所有已订阅网站新闻
  /// 情况二： [isRefresh]为true，从网络加载所有已订阅网站新闻
  Future<Result> _load(bool isRefresh) async {
    try {
      final result = await _siteRepository.getSites(isRefresh: isRefresh);
      switch (result) {
        case Ok<List<Site>>():
          _siteEntities = result.value;
        case Error<List<Site>>():
          return result;
      }
    } finally {
      notifyListeners();
    }
    return Result.ok(null);
  }
}
