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

  /// `Ứng dụng gọi video trực tuyến hoàn toàn miến phí`
  String get app_description {
    return Intl.message(
      'Ứng dụng gọi video trực tuyến hoàn toàn miến phí',
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
  String get or_register_now {
    return Intl.message(
      'Hoặc đang ký ngay',
      name: 'or_register_now',
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
  String get what_is_phone_number {
    return Intl.message(
      'Chào mừng bạn! Số điện thoại của bạn là gì?',
      name: 'what_is_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Bạn sẽ cần số điện thoại để xác thực thông tin và đăng nhập vào ứng dụng.`
  String get reason_provide_phone_number {
    return Intl.message(
      'Bạn sẽ cần số điện thoại để xác thực thông tin và đăng nhập vào ứng dụng.',
      name: 'reason_provide_phone_number',
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

  /// `Đóng`
  String get close {
    return Intl.message(
      'Đóng',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Tìm mã vùng`
  String get find_dial_code {
    return Intl.message(
      'Tìm mã vùng',
      name: 'find_dial_code',
      desc: '',
      args: [],
    );
  }

  /// `Invalid credentials`
  String get invalid_credentials {
    return Intl.message(
      'Invalid credentials',
      name: 'invalid_credentials',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Connect timeout`
  String get connect_timeout {
    return Intl.message(
      'Connect timeout',
      name: 'connect_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout`
  String get receive_timeout {
    return Intl.message(
      'Receive timeout',
      name: 'receive_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout`
  String get send_timeout {
    return Intl.message(
      'Send timeout',
      name: 'send_timeout',
      desc: '',
      args: [],
    );
  }

  /// `There are some problems with the connection. Please try again`
  String get connection_problem {
    return Intl.message(
      'There are some problems with the connection. Please try again',
      name: 'connection_problem',
      desc: '',
      args: [],
    );
  }

  /// `Làm ơn kiểm tra kết nối mạng.`
  String get please_check_internet_connection {
    return Intl.message(
      'Làm ơn kiểm tra kết nối mạng.',
      name: 'please_check_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi.`
  String get server_error {
    return Intl.message(
      'Lỗi.',
      name: 'server_error',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi không xác định.`
  String get unknown_error {
    return Intl.message(
      'Lỗi không xác định.',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi không kết nối được với máy chủ, vui lòng quay lại sau.`
  String get server_unknown_error {
    return Intl.message(
      'Lỗi không kết nối được với máy chủ, vui lòng quay lại sau.',
      name: 'server_unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Thành công.`
  String get code_200 {
    return Intl.message(
      'Thành công.',
      name: 'code_200',
      desc: '',
      args: [],
    );
  }

  /// `Thất bại.`
  String get code_500 {
    return Intl.message(
      'Thất bại.',
      name: 'code_500',
      desc: '',
      args: [],
    );
  }

  /// `Cần đăng nhập.`
  String get code_401 {
    return Intl.message(
      'Cần đăng nhập.',
      name: 'code_401',
      desc: '',
      args: [],
    );
  }

  /// `Cần đăng nhập.`
  String get code_403 {
    return Intl.message(
      'Cần đăng nhập.',
      name: 'code_403',
      desc: '',
      args: [],
    );
  }

  /// `Không tìm thấy.`
  String get code_404 {
    return Intl.message(
      'Không tìm thấy.',
      name: 'code_404',
      desc: '',
      args: [],
    );
  }

  /// `Expectation failed.`
  String get code_417 {
    return Intl.message(
      'Expectation failed.',
      name: 'code_417',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi không xác định.`
  String get code_1000 {
    return Intl.message(
      'Lỗi không xác định.',
      name: 'code_1000',
      desc: '',
      args: [],
    );
  }

  /// `Email hoặc mật khẩu không đúng.`
  String get code_1001 {
    return Intl.message(
      'Email hoặc mật khẩu không đúng.',
      name: 'code_1001',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản mạng xã hội không đúng.`
  String get code_1002 {
    return Intl.message(
      'Tài khoản mạng xã hội không đúng.',
      name: 'code_1002',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại và mật khẩu không đúng.`
  String get code_1003 {
    return Intl.message(
      'Số điện thoại và mật khẩu không đúng.',
      name: 'code_1003',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu không được để trống.`
  String get code_1004 {
    return Intl.message(
      'Mật khẩu không được để trống.',
      name: 'code_1004',
      desc: '',
      args: [],
    );
  }

  /// `Email không được để trống.`
  String get code_1005 {
    return Intl.message(
      'Email không được để trống.',
      name: 'code_1005',
      desc: '',
      args: [],
    );
  }

  /// `Email đã tồn tại.`
  String get code_1006 {
    return Intl.message(
      'Email đã tồn tại.',
      name: 'code_1006',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản mạng xã hội đã tồn tại.`
  String get code_1007 {
    return Intl.message(
      'Tài khoản mạng xã hội đã tồn tại.',
      name: 'code_1007',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại không được để trống.`
  String get code_1008 {
    return Intl.message(
      'Số điện thoại không được để trống.',
      name: 'code_1008',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại đã tồn tại.`
  String get code_1009 {
    return Intl.message(
      'Số điện thoại đã tồn tại.',
      name: 'code_1009',
      desc: '',
      args: [],
    );
  }

  /// `Mã nhân viên không được để trống.`
  String get code_1010 {
    return Intl.message(
      'Mã nhân viên không được để trống.',
      name: 'code_1010',
      desc: '',
      args: [],
    );
  }

  /// `Dung lượng file quá lớn.`
  String get code_1011 {
    return Intl.message(
      'Dung lượng file quá lớn.',
      name: 'code_1011',
      desc: '',
      args: [],
    );
  }

  /// `Tải lên tệp không thành công.`
  String get code_1012 {
    return Intl.message(
      'Tải lên tệp không thành công.',
      name: 'code_1012',
      desc: '',
      args: [],
    );
  }

  /// `Không hỗ trợ loại tệp tin này.`
  String get code_1013 {
    return Intl.message(
      'Không hỗ trợ loại tệp tin này.',
      name: 'code_1013',
      desc: '',
      args: [],
    );
  }

  /// `Thiết bị không được hỗ trợ.`
  String get code_1014 {
    return Intl.message(
      'Thiết bị không được hỗ trợ.',
      name: 'code_1014',
      desc: '',
      args: [],
    );
  }

  /// `Định dạng số điện thoại không đúng.`
  String get code_1015 {
    return Intl.message(
      'Định dạng số điện thoại không đúng.',
      name: 'code_1015',
      desc: '',
      args: [],
    );
  }

  /// `Định dạng email không đúng.`
  String get code_1016 {
    return Intl.message(
      'Định dạng email không đúng.',
      name: 'code_1016',
      desc: '',
      args: [],
    );
  }

  /// `Không tìm thấy người dùng này.`
  String get code_1017 {
    return Intl.message(
      'Không tìm thấy người dùng này.',
      name: 'code_1017',
      desc: '',
      args: [],
    );
  }

  /// `Dữ liệu không đúng.`
  String get code_1018 {
    return Intl.message(
      'Dữ liệu không đúng.',
      name: 'code_1018',
      desc: '',
      args: [],
    );
  }

  /// `Mã PIN đã hết hạn.`
  String get code_1019 {
    return Intl.message(
      'Mã PIN đã hết hạn.',
      name: 'code_1019',
      desc: '',
      args: [],
    );
  }

  /// `Mã PIN không đúng.`
  String get code_1020 {
    return Intl.message(
      'Mã PIN không đúng.',
      name: 'code_1020',
      desc: '',
      args: [],
    );
  }

  /// `Nhậm sai quá số lần cho phép.`
  String get code_1021 {
    return Intl.message(
      'Nhậm sai quá số lần cho phép.',
      name: 'code_1021',
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
