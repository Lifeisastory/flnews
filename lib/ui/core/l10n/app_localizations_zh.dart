// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String date_format(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.MMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String time_format(DateTime time) {
    final intl.DateFormat timeDateFormat = intl.DateFormat.jm(localeName);
    final String timeString = timeDateFormat.format(time);

    return '$timeString';
  }

  @override
  String get hot => '热榜';

  @override
  String get over => '-- 已经到底了 --';

  @override
  String get subscribe_title => '订阅';

  @override
  String get subscribe => '订阅';

  @override
  String get subscribed => '已订阅';

  @override
  String get settings => '设置';

  @override
  String get view_more => '更多';

  @override
  String get preferences => '个性化';

  @override
  String get language => '语言';

  @override
  String get choose_language => '选择应用语言';

  @override
  String get dark_mode => '深色模式';

  @override
  String get choose_dark_mode => '选择应用模式';

  @override
  String get theme => '主题';

  @override
  String get choose_theme => '选择应用主题';

  @override
  String get hot_list_count => '热榜显示条数';

  @override
  String get choose_hot_list_count => '选择热榜页面卡片显示新闻条数';

  @override
  String get webview_mode => '开启WebView';

  @override
  String get choose_webview_mode => '是否开启WebView（开启WebView后可订阅站点将少量增加，但会导致刷新时间显著增加。重启生效）';

  @override
  String piece(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString 条',
      one: '1 条',
      zero: '不显示',
    );
    return '$_temp0';
  }

  @override
  String get font_size => '字体大小';

  @override
  String get choose_font_size => '调整应用字体大小';

  @override
  String get other => '其他';

  @override
  String get restore_default => '恢复默认';

  @override
  String get ensure_restore_default => '确定恢复默认设置（包括默认订阅和个性化）吗？';

  @override
  String get about => '关于';

  @override
  String get app_info => '应用信息';

  @override
  String get app_intro => '这是一个新闻聚合应用';

  @override
  String get update => '更新';

  @override
  String get check_update => '检查更新';

  @override
  String get check_result => '已经是最新版本';

  @override
  String get just_now => '刚刚';

  @override
  String get five_min_ago => '5分钟前';

  @override
  String get ten_min_ago => '10分钟前';

  @override
  String get fifteen_min_ago => '15分钟前';

  @override
  String get thirty_min_ago => '30分钟前';

  @override
  String get one_hou_ago => '1小时前';

  @override
  String get five_hou_ago => '5小时前';

  @override
  String get ten_hou_ago => '10小时前';

  @override
  String get auto => '跟随系统';

  @override
  String get zh => '简体中文';

  @override
  String get en => '英文';

  @override
  String get dark => '深色模式';

  @override
  String get light => '浅色模式';

  @override
  String get confirm => '确认';

  @override
  String get cancel => '取消';

  @override
  String get blue => '天空蓝';

  @override
  String get pink => '少女粉';

  @override
  String get orange => '活力橙';

  @override
  String get red => '烈焰红';

  @override
  String get purple => '霞光紫';

  @override
  String get small => '小';

  @override
  String get standard => '标准';

  @override
  String get large => '大';

  @override
  String get extra_large => '超大';

  @override
  String get enbale => '启用';

  @override
  String get disable => '禁用';
}
