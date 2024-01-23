import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hans'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zh_HansText = '',
  }) =>
      [enText, zh_HansText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'b4hvk9xh': {
      'en': 'Label here...',
      'zh_Hans': '',
    },
    'cnzggrt5': {
      'en': 'Cust Func',
      'zh_Hans': '',
    },
    'vxqmgb6m': {
      'en': 'Page2',
      'zh_Hans': '',
    },
    '0hftsxpb': {
      'en': 'Page3',
      'zh_Hans': '',
    },
    'xblz0c5n': {
      'en': 'Add Struct?',
      'zh_Hans': '',
    },
    'tdbgqjkc': {
      'en': 'Add',
      'zh_Hans': '添加',
    },
    'usz6h672': {
      'en': 'Reset',
      'zh_Hans': '重置',
    },
    'cli4wxj0': {
      'en': 'Page Title',
      'zh_Hans': '',
    },
    'wji2p87b': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // badPage
  {
    'ypgig3z9': {
      'en': 'Hello World',
      'zh_Hans': '',
    },
    'dn4au6cz': {
      'en': 'API Call',
      'zh_Hans': '',
    },
    'wajltlja': {
      'en': 'Page2\n',
      'zh_Hans': '',
    },
    'i2leo4f6': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // page3
  {
    'y5gyreyb': {
      'en': 'Scan',
      'zh_Hans': '',
    },
    'q1g34ac1': {
      'en': 'Search',
      'zh_Hans': '',
    },
    'uralmvxn': {
      'en': 'Scan',
      'zh_Hans': '',
    },
    'ts6x96wx': {
      'en': 'Label here...',
      'zh_Hans': '',
    },
    'ui0rqp44': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // loginPage
  {
    'y07tlnka': {
      'en': 'email',
      'zh_Hans': '',
    },
    'wgzkguwk': {
      'en': 'password',
      'zh_Hans': '',
    },
    'pwcwwc08': {
      'en': 'Button',
      'zh_Hans': '',
    },
    'zhel142z': {
      'en': 'Hello World',
      'zh_Hans': '',
    },
    '4nhdh8c3': {
      'en': 'Login',
      'zh_Hans': '',
    },
    '637j5xs3': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // Action2SheetSimple
  {
    'fgq3zyeg': {
      'en': 'Edit Post',
      'zh_Hans': '',
    },
    'ic76w51o': {
      'en': 'Delete Story',
      'zh_Hans': '',
    },
    'itouqt9f': {
      'en': 'Cancel',
      'zh_Hans': '',
    },
  },
  // conEmail
  {
    'f1wla8mu': {
      'en': 'Label here...',
      'zh_Hans': '在这里标记...',
    },
  },
  // Miscellaneous
  {
    'a29xgkww': {
      'en': '',
      'zh_Hans': '',
    },
    'sq7wktc5': {
      'en': '',
      'zh_Hans': '',
    },
    '5qk57cj2': {
      'en': '',
      'zh_Hans': '',
    },
    '6u5btley': {
      'en': '',
      'zh_Hans': '',
    },
    'g8kwi8nt': {
      'en': '',
      'zh_Hans': '',
    },
    'q9bqg7ot': {
      'en': '',
      'zh_Hans': '',
    },
    'e3wln2k8': {
      'en': '',
      'zh_Hans': '',
    },
    'iryar6vf': {
      'en': '',
      'zh_Hans': '',
    },
    '8qxtnc8j': {
      'en': '',
      'zh_Hans': '',
    },
    'vl5bc9uf': {
      'en': '',
      'zh_Hans': '',
    },
    'rshey7wt': {
      'en': '',
      'zh_Hans': '',
    },
    'm82cp8ym': {
      'en': '',
      'zh_Hans': '',
    },
    '4jlg90as': {
      'en': '',
      'zh_Hans': '',
    },
    'gojklwyj': {
      'en': '',
      'zh_Hans': '',
    },
    'e4b82mjt': {
      'en': '',
      'zh_Hans': '',
    },
    'el1tjkfg': {
      'en': '',
      'zh_Hans': '',
    },
    'qzarl5hh': {
      'en': '',
      'zh_Hans': '',
    },
    's9c77fid': {
      'en': '',
      'zh_Hans': '',
    },
    'ye5ufkx8': {
      'en': '',
      'zh_Hans': '',
    },
    'qect6004': {
      'en': '',
      'zh_Hans': '',
    },
    'sqdthq3v': {
      'en': '',
      'zh_Hans': '',
    },
    'vxrhlmsa': {
      'en': '',
      'zh_Hans': '',
    },
    'tk7cvlk9': {
      'en': '',
      'zh_Hans': '',
    },
    'alp2kfh3': {
      'en': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
