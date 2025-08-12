import 'package:html/parser.dart';
import 'package:xpath_selector_html_parser/xpath_selector_html_parser.dart';

import '../../../domain/models/news/news.dart';
import '../../../domain/models/site_config/site_config.dart';

Future<List<News>> defaultXpathProcessor({
  required String html,
  required SiteConfig siteConfig,
}) async {
  List<News> news = [];

  final document = HtmlXPath.node(parse(html).documentElement!);

  final titles = _trimStringList(
    document.query(siteConfig.newsXpath.title).attrs,
  );
  final urls = _trimStringList(document.query(siteConfig.newsXpath.url).attrs);
  final popularities = _trimStringList(
    document.query(siteConfig.newsXpath.popularity).attrs,
  );
  final imageUrls =
      siteConfig.newsXpath.imageUrl != null
          ? document.query(siteConfig.newsXpath.imageUrl!).attrs
          : List.generate(titles.length, (_) => null);

  if (titles.length > 50) titles.length = 50;
  for (int i = 0; i < titles.length; i++) {
    news.add(
      News(
        siteId: siteConfig.id,
        siteName: siteConfig.name,
        siteIconUrl: siteConfig.iconUrl,
        position: i + 1,
        title: titles[i],
        url: urls[i],
        imageUrl: imageUrls.isEmpty? null : imageUrls[i],
        popularity: popularities[i],
      ),
    );
  }
  return news;
}

// 去除标题首尾空格
List<String> _trimStringList(List<String?> list) {
  return list.map((e) => e!.trim()).toList();
}
