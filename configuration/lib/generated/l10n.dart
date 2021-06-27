// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `OKILA`
  String get app_name {
    return Intl.message(
      'OKILA',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Luyện giao tiếp tiếng anh trực tuyến cùng với bạn bè quanh thế giới`
  String get app_description {
    return Intl.message(
      'Luyện giao tiếp tiếng anh trực tuyến cùng với bạn bè quanh thế giới',
      name: 'app_description',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập`
  String get login {
    return Intl.message(
      'Đăng nhập',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Hoặc đang ký ngay`
  String get orRegisterNow {
    return Intl.message(
      'Hoặc đang ký ngay',
      name: 'orRegisterNow',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký`
  String get register {
    return Intl.message(
      'Đăng ký',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Chào mừng bạn! Số điện thoại của bạn là gì?`
  String get whatIsPhoneNumber {
    return Intl.message(
      'Chào mừng bạn! Số điện thoại của bạn là gì?',
      name: 'whatIsPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Bạn sẽ cần số điện thoại để xác thực thông tin và đăng nhập vào ứng dụng.`
  String get reasonProvidePhoneNumber {
    return Intl.message(
      'Bạn sẽ cần số điện thoại để xác thực thông tin và đăng nhập vào ứng dụng.',
      name: 'reasonProvidePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Tiếp`
  String get next {
    return Intl.message(
      'Tiếp',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Tìm mã vùng`
  String get findDialCode {
    return Intl.message(
      'Tìm mã vùng',
      name: 'findDialCode',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
