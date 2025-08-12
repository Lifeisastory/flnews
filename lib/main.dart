import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/dependencies.dart';
import 'global/variable/global.dart';
import 'routing/router.dart';
import 'ui/core/l10n/app_localizations.dart';
import '../global/states.dart';

void main() {
  Global.init().then(
    (e) => runApp(MultiProvider(providers: providers, child: MainApp())),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // var global = Provider.of<GlobalState>(context);    // Provider.of<GlobalState>(context)和 Consumer<GlobalState>(context)
                                                          // 都可以监听 GlobalState 的状态改变并触发组件重绘。前者会重建整个调用它的Widget
                                                          // 后者只重建 Consumer 组件的 builder 子组件。
    return Consumer<GlobalState>(
      builder: (context, global, child) {
        return MaterialApp.router(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: global.theme,
              brightness:
                  global.darkMode == 'dark'
                      ? Brightness.dark
                      : Brightness.light,
            ).copyWith(primary: global.theme),
            textTheme: TextTheme(
              headlineLarge: TextStyle(
                fontSize: global.fontSize! * 26.0,
                fontWeight: FontWeight.bold,
              ),
              headlineMedium: TextStyle(
                fontSize: global.fontSize! * 24.0,
                fontWeight: FontWeight.bold,
              ),
              headlineSmall: TextStyle(
                fontSize: global.fontSize! * 22.0,
                fontWeight: FontWeight.bold,
              ),
              titleLarge: TextStyle(
                fontSize: global.fontSize! * 22.0,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                fontSize: global.fontSize! * 20.0,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: TextStyle(
                fontSize: global.fontSize! * 18.0,
                fontWeight: FontWeight.bold,
              ),
              bodyLarge: TextStyle(
                fontSize: global.fontSize! * 18.0,
                fontWeight: FontWeight.normal,
              ),
              bodyMedium: TextStyle(
                fontSize: global.fontSize! * 16.0,
                fontWeight: FontWeight.normal,
              ),
              bodySmall: TextStyle(
                fontSize: global.fontSize! * 14.0,
                fontWeight: FontWeight.normal,
              ),
              labelLarge: TextStyle(
                fontSize: global.fontSize! * 14.0,
                fontWeight: FontWeight.normal,
              ),
              labelMedium: TextStyle(
                fontSize: global.fontSize! * 12.0,
                fontWeight: FontWeight.normal,
              ),
              labelSmall: TextStyle(
                fontSize: global.fontSize! * 10.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          locale: global.getLocale(),
          localeResolutionCallback: (locale, supportedLocales) {
            if (global.getLocale() != null) {
              //如果已经选定语言，则不跟随系统
              return global.getLocale();
            } else {
              if (supportedLocales.contains(locale)) {
                return locale!;
              } else {
                //如果系统语言不是中文简体或美国英语，则默认使用中文
                return Locale('zh');
              }
            }
          },
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: router(),
        );
      },
    );
  }
}
