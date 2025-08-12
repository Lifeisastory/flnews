import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/states.dart';
import '../../core/l10n/app_localizations.dart';
import 'news_card.dart';
import '../view_models/hot_viewmodel.dart';
import '../../../ui/scaffold_viewmodel.dart';

class HotScreen extends StatefulWidget {
  const HotScreen({super.key, required this.viewModel});

  final HotViewModel viewModel;

  @override
  State<HotScreen> createState() => _HotScreenState();
}

class _HotScreenState extends State<HotScreen> {
  late Timer _timer;

  @override
  void initState() {
    widget.viewModel.load.execute(false);
    _timer = Timer.periodic(Duration(minutes: 2), (t) { 
      widget.viewModel.updateTime();
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HotScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalState>(context, listen: false);
    return Builder(
      builder: (context) {
        return ListenableBuilder(
          listenable: widget.viewModel.load,
          builder: (context, child) {
            if (widget.viewModel.load.running) {
              return const Center(child: CircularProgressIndicator());
            }
            return child!;
          },
          child: ListenableBuilder(
            listenable: widget.viewModel,
            builder: (context, _) {
              return RefreshIndicator(
                onRefresh: () async =>widget.viewModel.load.execute(true),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    Provider.of<CustomScaffoldViewModel>(
                      context,
                      listen: false,
                    ).onScroll(notification);
                    return false; // 拦截滚动通知不向上级继续冒泡
                  },
                  child: CustomScrollView(
                    slivers: [
                      SliverList.builder(
                        itemCount: widget.viewModel.siteEntities.length + 2,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return SizedBox(height: global.barHeight);
                          }
                          if (index ==
                              widget.viewModel.siteEntities.length + 1) {
                            return Container(
                              height: global.barHeight,
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!.over,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            );
                          }
                          return Container(
                            margin: const EdgeInsets.only(
                              top: 10.0,
                              left: 10.0,
                              right: 10.0,
                            ),
                            child: NewsCard(
                              viewModel: widget.viewModel,
                              siteEntity:
                                  widget.viewModel.siteEntities[index - 1],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
