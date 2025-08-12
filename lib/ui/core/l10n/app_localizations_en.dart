// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

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
  String get hot => 'Hot';

  @override
  String get over => '-- It\'s over --';

  @override
  String get subscribe_title => 'Subscribe';

  @override
  String get subscribe => 'subscribe';

  @override
  String get subscribed => 'subscribed';

  @override
  String get settings => 'Settings';

  @override
  String get view_more => 'More';

  @override
  String get preferences => 'Preferences';

  @override
  String get language => 'Language';

  @override
  String get choose_language => 'Choose app language';

  @override
  String get dark_mode => 'Dark mode';

  @override
  String get choose_dark_mode => 'Choose dark mode';

  @override
  String get theme => 'Theme';

  @override
  String get choose_theme => 'Choose app theme';

  @override
  String get hot_list_count => 'Hot items count';

  @override
  String get choose_hot_list_count => 'Choose how many hot items diaplay';

  @override
  String get webview_mode => 'Enable WebView';

  @override
  String get choose_webview_mode => 'After enabling WebView, the number of subscribable sites will slightly increase, but the refresh time will significantly increase(restart app to take effect).';

  @override
  String piece(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString pieces',
      one: '1 piece',
      zero: 'no items',
    );
    return '$_temp0';
  }

  @override
  String get font_size => 'Font size';

  @override
  String get choose_font_size => 'Ajust app font size';

  @override
  String get other => 'Other';

  @override
  String get restore_default => 'Restore default';

  @override
  String get ensure_restore_default => 'Are you sure to restore the default settings(include sites and preferences)?';

  @override
  String get about => 'About';

  @override
  String get app_info => 'App information';

  @override
  String get app_intro => 'A news agrregation app';

  @override
  String get update => 'Update';

  @override
  String get check_update => 'Check update';

  @override
  String get check_result => 'It\'s the latest version.';

  @override
  String get just_now => 'Just now';

  @override
  String get five_min_ago => '5 minutes ago';

  @override
  String get ten_min_ago => '10 minutes ago';

  @override
  String get fifteen_min_ago => '15 minutes ago';

  @override
  String get thirty_min_ago => '30 minutes ago';

  @override
  String get one_hou_ago => '1 hour ago';

  @override
  String get five_hou_ago => '5 hours ago';

  @override
  String get ten_hou_ago => '10 hours ago';

  @override
  String get auto => 'Auto';

  @override
  String get zh => 'Simplified Chinese';

  @override
  String get en => 'English';

  @override
  String get dark => 'Dark mode';

  @override
  String get light => 'Light mode';

  @override
  String get confirm => 'Confirm';

  @override
  String get cancel => 'Cancel';

  @override
  String get blue => 'Sky blue';

  @override
  String get pink => 'Cute pink';

  @override
  String get orange => 'Vital orange';

  @override
  String get red => 'Flame red';

  @override
  String get purple => 'Violet purple';

  @override
  String get small => 'Small';

  @override
  String get standard => 'Standard';

  @override
  String get large => 'Large';

  @override
  String get extra_large => 'Extra large';

  @override
  String get enbale => 'Enable';

  @override
  String get disable => 'Disable';
}
