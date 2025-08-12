import 'package:flutter/material.dart';

import 'variable/global.dart';

class GlobalState extends ChangeNotifier {
  final _profile = Global.profile;

  double get barHeight => Global.barHeight;
  
  @override
  void notifyListeners() {
    Global.saveProfile(); //保存Profile变更
    super.notifyListeners(); //通知依赖的Widget更新
  }

  void restoreProfile() {
    _profile.locale = "zh";
    _profile.darkMode = "dark";
    _profile.theme = 0;
    _profile.hotCounts = 10;
    _profile.fontSize = 1.0;
    _profile.isWebViewOn = false;
    notifyListeners();
  }

  Locale? getLocale() {
    if (_profile.locale == null) return null;
    return Locale(_profile.locale!);
  }

  String? get locale => _profile.locale;

  set locale(String? locale) {
    if (locale != _profile.locale) {
      _profile.locale = locale;
      notifyListeners();
    }
  }

  String? get darkMode => _profile.darkMode;

  set darkMode(String? darkMode) {
    if (darkMode != _profile.darkMode) {
      _profile.darkMode = darkMode;
      notifyListeners();
    }
  }

  // 获取主题列表
  List<MaterialColor> get themes => Global.themes;

  // 获取当前主题，如果未设置主题，则默认使用蓝色主题
  MaterialColor get theme => Global.themes.firstWhere(
    (e) => e.toARGB32() == _profile.theme,
    orElse: () => Colors.blue,
  );

  // 主题改变后，通知其依赖项，新主题会立即生效
  set theme(MaterialColor color) {
    if (color != theme) {
      _profile.theme = color.toARGB32();
      notifyListeners();
    }
  }

  int? get hotCounts => _profile.hotCounts;

  set hotCounts(int? hotCounts) {
    if (hotCounts != _profile.hotCounts) {
      _profile.hotCounts = hotCounts;
      notifyListeners();
    }
  }

  double? get fontSize => _profile.fontSize;

  set fontSize(double? fontSize) {
    if (fontSize != _profile.fontSize) {
      _profile.fontSize = fontSize;
      notifyListeners();
    }
  }

}
