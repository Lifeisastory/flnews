
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/states.dart';
import '../../../global/variable/global.dart';
import '../../core/l10n/app_localizations.dart';
import '../view_models/settings_viewmodel.dart';
import 'about_dialog.dart';
import 'dark_mode_dialog.dart';
import 'font_size_dialog.dart';
import 'hot_counts_dialog.dart';
import 'locale_dialog.dart';
import 'restore_dialog.dart';
import 'theme_dialog.dart';
import 'update_dialog.dart';
import 'webview_mode_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.viewmodel});

  final SettingsViewModel viewmodel;

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<GlobalState>(
      context,
      listen: false,
    ); // 全局状态的更改会引起整个应用重绘，所以不必在这里监听全局状态的更改

    final Map<String, List<Map<IconData, String>>> settingGroup = {
      AppLocalizations.of(context)!.preferences: [
        {Icons.language: AppLocalizations.of(context)!.language},
        {Icons.dark_mode: AppLocalizations.of(context)!.dark_mode},
        {Icons.color_lens: AppLocalizations.of(context)!.theme},
        {Icons.list: AppLocalizations.of(context)!.hot_list_count},
        {Icons.font_download: AppLocalizations.of(context)!.font_size},
        {Icons.web: AppLocalizations.of(context)!.webview_mode},
      ],
      AppLocalizations.of(context)!.other: [
        {
          Icons.settings_backup_restore:
              AppLocalizations.of(context)!.restore_default,
        },
        {Icons.info: AppLocalizations.of(context)!.about},
        {Icons.upgrade: AppLocalizations.of(context)!.update},
      ],
    };
    return ListenableBuilder(
      listenable: viewmodel.load,
      builder: (context, child) {
        if (viewmodel.load.running) {
          return const Center(child: CircularProgressIndicator());
        }
        return child!;
      },
      child: ListenableBuilder(
        listenable: viewmodel,
        builder: (context, _) {
          return CustomScrollView(
            slivers: [
              SliverList.builder(
                itemCount:
                    settingGroup.length + 2, // 给最后一个元素后面添加空白防止被bottombar遮挡
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return SizedBox(height: global.barHeight);
                  }
                  if (index == settingGroup.length + 1) {
                    return SizedBox(height: global.barHeight);
                  }
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 10.0,
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          settingGroup.keys.toList()[index - 1], // 遍历map的key
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 15),
                          child: Column(
                            children:
                                settingGroup[settingGroup.keys.toList()[index -
                                        1]]! // 根据map的key获取value
                                    .map(
                                      (e) => SizedBox(
                                        height: 60 * global.fontSize!,
                                        child: InkWell(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                          onTap: () {
                                            _showOptionsDialog(
                                              context,
                                              e.keys.first,
                                            );
                                          },
                                          child: Row(
                                            spacing: 10,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                e.keys.first,
                                                color:
                                                    Theme.of(
                                                      context,
                                                    ).colorScheme.primary,
                                                size: 28 * global.fontSize!,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    e.values.first,
                                                    style:
                                                        Theme.of(
                                                          context,
                                                        ).textTheme.bodyLarge,
                                                  ),
                                                  if (settingGroup.keys
                                                          .toList()[index -
                                                          1] ==
                                                      AppLocalizations.of(
                                                        context,
                                                      )!.preferences)
                                                    Text(
                                                      _getSubText(
                                                        context,
                                                        global,
                                                        e.keys.first,
                                                      ),
                                                      style:
                                                          Theme.of(
                                                            context,
                                                          ).textTheme.bodySmall,
                                                    ),
                                                ],
                                              ),
                                              Spacer(),
                                              Icon(
                                                Icons.chevron_right_outlined,
                                                size: 26 * global.fontSize!,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _showOptionsDialog(BuildContext context, IconData option) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        switch (option) {
          case Icons.language:
            return LocaleDialog();
          case Icons.dark_mode:
            return DarkModeDialog();
          case Icons.color_lens:
            return ThemeDialog();
          case Icons.list:
            return HotCountsDialog();
          case Icons.font_download:
            return FontSizeDialog();
          case Icons.web:
            return WebViewModeDialog();
          case Icons.settings_backup_restore:
            return RestoreDialog(onRestore: viewmodel.restoreSitesConfig);
          case Icons.info:
            return CustomAboutDialog();
          case Icons.upgrade:
            return UpdateDialog();
          default:
            return UpdateDialog();
        }
      },
    );
  }

  String _getSubText(
    BuildContext context,
    GlobalState global,
    IconData option,
  ) {
    return switch (option) {
      Icons.language => switch (global.locale ?? 'auto') {
        'auto' => AppLocalizations.of(context)!.auto,
        'zh' => AppLocalizations.of(context)!.zh,
        'en' => AppLocalizations.of(context)!.en,
        _ => throw UnimplementedError("language"),
      },
      Icons.dark_mode => switch (global.darkMode ?? 'auto') {
        'auto' => AppLocalizations.of(context)!.auto,
        'light' => AppLocalizations.of(context)!.light,
        'dark' => AppLocalizations.of(context)!.dark,
        _ => throw UnimplementedError("dark_mode"),
      },
      Icons.color_lens => switch (global.theme) {
        Colors.blue => AppLocalizations.of(context)!.blue,
        Colors.pink => AppLocalizations.of(context)!.pink,
        Colors.orange => AppLocalizations.of(context)!.orange,
        Colors.red => AppLocalizations.of(context)!.red,
        Colors.purple => AppLocalizations.of(context)!.purple,
        _ => throw UnimplementedError("theme"),
      },
      Icons.list => global.hotCounts.toString(),
      Icons.font_download => switch (global.fontSize) {
        0.75 => AppLocalizations.of(context)!.small,
        1.0 => AppLocalizations.of(context)!.standard,
        1.25 => AppLocalizations.of(context)!.large,
        1.5 => AppLocalizations.of(context)!.extra_large,
        _ => throw UnimplementedError("font_size"),
      },
      Icons.web => switch (Global.isWebViewOn) {
        true => AppLocalizations.of(context)!.enbale,
        false => AppLocalizations.of(context)!.disable,
      },
      _ => throw UnimplementedError("getSubText"),
    };
  }
}
