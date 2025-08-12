import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/states.dart';
import '../../../domain/models/news/news.dart';
import '../../../domain/models/site/site.dart';
import '../../core/l10n/app_localizations.dart';
import '../view_models/hot_viewmodel.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({
    super.key,
    required this.siteEntity,
    required this.viewModel,
  });

  final Site siteEntity;
  final HotViewModel viewModel;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalState>(context, listen: false);
    return Card(
      margin: const EdgeInsets.all(0.0), // 清除默认边距
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Row(
              spacing: 5,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    widget.siteEntity.iconUrl,
                    width: 24 * global.fontSize!,
                    height: 24 * global.fontSize!,
                  ),
                ),
                Text(
                  widget.siteEntity.name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Spacer(),
                IconButton(
                  onPressed: () async {
                    widget.viewModel.refresh.execute(widget.siteEntity.id);
                    _controller.forward();
                    await Future.delayed(Duration(seconds: 1));
                    _controller.reset();
                  },
                  icon: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle:
                            Tween(
                              begin: 0.0,
                              end: 6.28,
                            ).animate(_controller).value,
                        child: Icon(
                          Icons.refresh,
                          color: Theme.of(context).colorScheme.primary,
                          size: 24 * global.fontSize!,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            ListenableBuilder(
              listenable: widget.viewModel.refresh,
              builder: (context, child) {
                if (widget.viewModel.refresh.running &&
                    widget.viewModel.siteId == widget.siteEntity.id) {
                  return SizedBox(
                    height: 34 * global.fontSize! * global.hotCounts!, // 空白卡片
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (widget.siteEntity.news.isEmpty) {
                  return SizedBox(
                    height: 34 * global.fontSize! * global.hotCounts!, 
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, color: Theme.of(context).colorScheme.primary),
                        Text('Failed to load news', style: Theme.of(context).textTheme.bodyMedium,)
                      ],
                    ),
                  );
                }
                return Column(
                  children:
                      widget.siteEntity.news
                          .take(global.hotCounts ?? 10)
                          .toList()
                          .map((news) {
                            return _CardItem(news: news);
                          })
                          .toList(),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _convertTime(context),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                TextButton(
                  onPressed: () => widget.viewModel.viewMore(),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: AppLocalizations.of(context)!.view_more),
                        WidgetSpan(
                          child: Icon(
                            Icons.chevron_right,
                            size: 16 * global.fontSize!,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize:
                            Theme.of(context).textTheme.labelLarge!.fontSize,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _convertTime(context) {
    final minutes =
        widget.viewModel.newsUpdateTime
            .difference(widget.siteEntity.updateTime)
            .inMinutes;

    if (minutes < 5) {
      return AppLocalizations.of(context)!.just_now;
    } else if (minutes < 10) {
      return AppLocalizations.of(context)!.five_min_ago;
    } else if (minutes < 15) {
      return AppLocalizations.of(context)!.ten_min_ago;
    } else if (minutes < 20) {
      return AppLocalizations.of(context)!.fifteen_min_ago;
    } else if (minutes < 35) {
      return AppLocalizations.of(context)!.thirty_min_ago;
    } else if (minutes < 65) {
      return AppLocalizations.of(context)!.one_hou_ago;
    } else if (minutes < 305) {
      return AppLocalizations.of(context)!.five_hou_ago;
    } else if (minutes < 605) {
      return AppLocalizations.of(context)!.ten_hou_ago;
    } else {
      return '${AppLocalizations.of(context)!.date_format(widget.siteEntity.updateTime)} · ${AppLocalizations.of(context)!.time_format(widget.siteEntity.updateTime)}';
    }
  }
}

class _CardItem extends StatelessWidget {
  const _CardItem({required this.news});

  final News news;
  static const List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    var fontSize = Provider.of<GlobalState>(context, listen: false).fontSize!;
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () {},
        splashColor: Theme.of(context).splashColor,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                height: 24 * fontSize,
                width: 24 * fontSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color:
                      news.position < 4 ? colors[news.position - 1] : colors[3],
                ),
                child: Center(
                  child: Text(
                    news.position.toString(),
                    style: TextStyle(
                      color: news.position > 3 ? Colors.black : Colors.white,
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium!.fontSize,
                      fontWeight:
                          news.position > 3
                              ? FontWeight.normal
                              : FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                news.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                  fontWeight:
                      news.position > 3 ? FontWeight.normal : FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 24 * fontSize,
              width: 24 * fontSize,
              margin: EdgeInsets.only(right: 6),
              child: Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.primary,
                size: 24 * fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
