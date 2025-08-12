import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/l10n/app_localizations.dart';
import 'core/ui/bottom_bar.dart';
import 'core/ui/top_bar.dart';
import '../global/states.dart';
import '../ui/hot/widgets/hot_screen.dart';
import '../ui/settings/widgets/settings_screen.dart';
import '../ui/subscribe/widgets/subscribe_screen.dart';
import '../ui/hot/view_models/hot_viewmodel.dart';
import '../ui/settings/view_models/settings_viewmodel.dart';
import '../ui/subscribe/view_models/subscribe_viewmodel.dart';
import '../../ui/scaffold_viewmodel.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({super.key});

  @override
  State<CustomScaffold> createState() => _CustomScaffold();
}

class _CustomScaffold extends State<CustomScaffold> {
  late PageController _pageController; // 为了让PageView支持滑动切换和点击切换双模式

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> pagesName = [
      AppLocalizations.of(context)!.hot,
      AppLocalizations.of(context)!.subscribe_title,
      AppLocalizations.of(context)!.settings,
    ];
    final List<Widget> pages = [
      HotScreen(viewModel: HotViewModel(siteRepository: context.read())),
      SubscribeScreen(
        viewmodel: SubscribeViewModel(
          siteConfigRepository: context.read(),
          siteRepository: context.read(),
        ),
      ),
      SettingsScreen(
        viewmodel: SettingsViewModel(siteConfigRepository: context.read()),
      ),
    ];
    var global = Provider.of<GlobalState>(context, listen: false);
    return Consumer<CustomScaffoldViewModel>(
      builder: (context, viewmodel, child) {
        return Material(
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    viewmodel.switchPage(value);
                  },
                  children: pages,
                ),
                Positioned(
                  top:
                      viewmodel.currentPageIndex == 0
                          ? -viewmodel.barOffset
                          : 0,
                  left: 0,
                  right: 0,
                  height: global.barHeight,
                  child: Opacity(
                    opacity:
                        viewmodel.currentPageIndex == 0
                            ? 1 - viewmodel.barOffset / global.barHeight
                            : 1,
                    child: TopBar(
                      pageName: pagesName[viewmodel.currentPageIndex],
                    ),
                  ),
                ),
                Positioned(
                  bottom:
                      viewmodel.currentPageIndex == 0
                          ? -viewmodel.barOffset
                          : 0,
                  left: 0,
                  right: 0,
                  height: global.barHeight,
                  child: Opacity(
                    opacity:
                        viewmodel.currentPageIndex == 0
                            ? 1 - viewmodel.barOffset / global.barHeight
                            : 1,
                    child: BottomBar(pageController: _pageController),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
