import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile_model/profile.dart';
import '../../ui/core/themes/themes.dart';

class Global {
  static late SharedPreferences _prefs;
  static late Profile profile;
  static double barHeight = 60.0;

  // 可选的主题列表
  static List<MaterialColor> get themes => Themes.themes;

  // 初始化全局信息
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
    var prof = _prefs.getString("profile");
    if (prof != null) {
      try {
        profile = Profile.fromJson(jsonDecode(prof));
      } catch (e) {
        throw Exception("Profile数据格式错误");
      }
    } else {
      // 默认偏好
      profile =
          Profile()
            ..locale = "zh"
            ..darkMode = "dark"
            ..theme = 0
            ..hotCounts = 10
            ..fontSize = 1.0
            ..isWebViewOn = false;
    }
  }

  static bool get isWebViewOn => profile.isWebViewOn ?? false;

  static set isWebViewOn(bool value) {
    if (value != profile.isWebViewOn) {
      profile.isWebViewOn = value;
      saveProfile();
    }
  }

  static saveProfile() =>
      _prefs.setString("profile", jsonEncode(profile.toJson()));
}
