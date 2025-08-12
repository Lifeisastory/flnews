import '../../../domain/models/news/news.dart';
import '../../../domain/models/site/site.dart';
import '../../../domain/models/site_config/site_config.dart';
import '../../../utils/result.dart';
import '../../services/api/api_client_service.dart';
import '../../services/local/local_database_service.dart';
import '../../../global/variable/global.dart';
import 'default_xpath_processor.dart';

class SiteRepository {
  SiteRepository({
    required ApiClientService apiClientSvc,
    required LocalDatabaseService localDatabaseSvc,
  }) : _apiClientSvc = apiClientSvc,
       _localDatabaseSvc = localDatabaseSvc;

  final ApiClientService _apiClientSvc;
  final LocalDatabaseService _localDatabaseSvc;

  /// 情况一： [id]不为空，根据[id]从网络获取单一网站新闻。用于新闻卡片刷新按钮的回调函数
  /// 情况二： [id]为空，[isRefresh]为默认，从数据库获取全部已订阅网站新闻。在热榜页重建时使用
  /// 情况三： [id]为空，[isRefresh]为true，从网络获取全部已订阅网站新闻。在热榜页下拉刷新时使用
  Future<Result<List<Site>>> getSites({int? id, bool isRefresh = false}) async {
    if (id != null) {
      return await _getSites(id: id);
    } else {
      if (!(isRefresh)) {
        // 从数据库中获取已订阅站点的数据
        var sites = await _localDatabaseSvc.retrieveSubscribedSitesTable();
        return Result.ok(sites);
      } else {
        return await _getSites();
      }
    }
  }

  Future<Result<List<News>>> _getNews({required SiteConfig siteConfig}) async {
    Result<String> html;
    if (Global.isWebViewOn) {
      html = await _apiClientSvc.getRenderedSiteHtml(url: siteConfig.url);
    } else {
      html = await _apiClientSvc.getSiteHtml(url: siteConfig.url);
    }

    switch (html) {
      case Ok<String>():
        var news = await defaultXpathProcessor(
          html: html.value,
          siteConfig: siteConfig,
        );
        return Result.ok(news);
      case Error<String>():
        return Result.error(html.error);
    }
  }

  /// 情况一：[id]为空，从网络获取所有网站新闻
  /// 情况二：[id]不为空，根据[id]从网络获取指定网站新闻
  Future<Result<List<Site>>> _getSites({int? id}) async {
    List<Site> sites = [];
    List<News> news = [];
    var subscribedSitesConfig =
        await _localDatabaseSvc
            .retrieveSubscribedSitesConfigTable(); // 只获取已订阅站点配置

    // 按照订阅排序的顺序在hot页面显示
    subscribedSitesConfig.sort((a, b) => a.sort.compareTo(b.sort));

    for (final siteConfig in subscribedSitesConfig) {
      if (id != null) {
        if (siteConfig.id != id) {
          continue;
        }
      }

      var result = await _getNews(siteConfig: siteConfig);
      switch (result) {
        case Ok<List<News>>():
          news = result.value;
          break;
        case Error<List<News>>():
          return Result.error(result.error);
      }

      var site = Site(
        id: siteConfig.id,
        name: siteConfig.name,
        iconUrl: siteConfig.iconUrl,
        updateTime: DateTime.now(),
        news: news,
      );
      await _localDatabaseSvc.upsertsIntoSitesTable(site); // 更新数据库新闻内容
      sites.add(site);
    }
    return Result.ok(sites);
  }
}
