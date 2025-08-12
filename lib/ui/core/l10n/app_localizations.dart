import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh')
  ];

  /// A message with a date parameter
  ///
  /// In en, this message translates to:
  /// **'{date}'**
  String date_format(DateTime date);

  /// A message with a date parameter
  ///
  /// In en, this message translates to:
  /// **'{time}'**
  String time_format(DateTime time);

  /// No description provided for @hot.
  ///
  /// In en, this message translates to:
  /// **'Hot'**
  String get hot;

  /// No description provided for @over.
  ///
  /// In en, this message translates to:
  /// **'-- It\'s over --'**
  String get over;

  /// No description provided for @subscribe_title.
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get subscribe_title;

  /// No description provided for @subscribe.
  ///
  /// In en, this message translates to:
  /// **'subscribe'**
  String get subscribe;

  /// No description provided for @subscribed.
  ///
  /// In en, this message translates to:
  /// **'subscribed'**
  String get subscribed;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @view_more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get view_more;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @choose_language.
  ///
  /// In en, this message translates to:
  /// **'Choose app language'**
  String get choose_language;

  /// No description provided for @dark_mode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get dark_mode;

  /// No description provided for @choose_dark_mode.
  ///
  /// In en, this message translates to:
  /// **'Choose dark mode'**
  String get choose_dark_mode;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @choose_theme.
  ///
  /// In en, this message translates to:
  /// **'Choose app theme'**
  String get choose_theme;

  /// No description provided for @hot_list_count.
  ///
  /// In en, this message translates to:
  /// **'Hot items count'**
  String get hot_list_count;

  /// No description provided for @choose_hot_list_count.
  ///
  /// In en, this message translates to:
  /// **'Choose how many hot items diaplay'**
  String get choose_hot_list_count;

  /// No description provided for @webview_mode.
  ///
  /// In en, this message translates to:
  /// **'Enable WebView'**
  String get webview_mode;

  /// No description provided for @choose_webview_mode.
  ///
  /// In en, this message translates to:
  /// **'After enabling WebView, the number of subscribable sites will slightly increase, but the refresh time will significantly increase(restart app to take effect).'**
  String get choose_webview_mode;

  /// A plural message
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{no items} =1{1 piece} other{{count} pieces}}'**
  String piece(num count);

  /// No description provided for @font_size.
  ///
  /// In en, this message translates to:
  /// **'Font size'**
  String get font_size;

  /// No description provided for @choose_font_size.
  ///
  /// In en, this message translates to:
  /// **'Ajust app font size'**
  String get choose_font_size;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @restore_default.
  ///
  /// In en, this message translates to:
  /// **'Restore default'**
  String get restore_default;

  /// No description provided for @ensure_restore_default.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to restore the default settings(include sites and preferences)?'**
  String get ensure_restore_default;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @app_info.
  ///
  /// In en, this message translates to:
  /// **'App information'**
  String get app_info;

  /// No description provided for @app_intro.
  ///
  /// In en, this message translates to:
  /// **'A news agrregation app'**
  String get app_intro;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @check_update.
  ///
  /// In en, this message translates to:
  /// **'Check update'**
  String get check_update;

  /// No description provided for @check_result.
  ///
  /// In en, this message translates to:
  /// **'It\'s the latest version.'**
  String get check_result;

  /// No description provided for @just_now.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get just_now;

  /// No description provided for @five_min_ago.
  ///
  /// In en, this message translates to:
  /// **'5 minutes ago'**
  String get five_min_ago;

  /// No description provided for @ten_min_ago.
  ///
  /// In en, this message translates to:
  /// **'10 minutes ago'**
  String get ten_min_ago;

  /// No description provided for @fifteen_min_ago.
  ///
  /// In en, this message translates to:
  /// **'15 minutes ago'**
  String get fifteen_min_ago;

  /// No description provided for @thirty_min_ago.
  ///
  /// In en, this message translates to:
  /// **'30 minutes ago'**
  String get thirty_min_ago;

  /// No description provided for @one_hou_ago.
  ///
  /// In en, this message translates to:
  /// **'1 hour ago'**
  String get one_hou_ago;

  /// No description provided for @five_hou_ago.
  ///
  /// In en, this message translates to:
  /// **'5 hours ago'**
  String get five_hou_ago;

  /// No description provided for @ten_hou_ago.
  ///
  /// In en, this message translates to:
  /// **'10 hours ago'**
  String get ten_hou_ago;

  /// No description provided for @auto.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get auto;

  /// No description provided for @zh.
  ///
  /// In en, this message translates to:
  /// **'Simplified Chinese'**
  String get zh;

  /// No description provided for @en.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get en;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light mode'**
  String get light;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @blue.
  ///
  /// In en, this message translates to:
  /// **'Sky blue'**
  String get blue;

  /// No description provided for @pink.
  ///
  /// In en, this message translates to:
  /// **'Cute pink'**
  String get pink;

  /// No description provided for @orange.
  ///
  /// In en, this message translates to:
  /// **'Vital orange'**
  String get orange;

  /// No description provided for @red.
  ///
  /// In en, this message translates to:
  /// **'Flame red'**
  String get red;

  /// No description provided for @purple.
  ///
  /// In en, this message translates to:
  /// **'Violet purple'**
  String get purple;

  /// No description provided for @small.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get small;

  /// No description provided for @standard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get standard;

  /// No description provided for @large.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get large;

  /// No description provided for @extra_large.
  ///
  /// In en, this message translates to:
  /// **'Extra large'**
  String get extra_large;

  /// No description provided for @enbale.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enbale;

  /// No description provided for @disable.
  ///
  /// In en, this message translates to:
  /// **'Disable'**
  String get disable;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
