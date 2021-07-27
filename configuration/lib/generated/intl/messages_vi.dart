// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'vi';

  static String m0(incorrectCount) =>
      "Mã không đúng. Bạn có thể thử thêm ${incorrectCount} lần nữa.";

  static String m1(userName) => "Good Afternoon ${userName}!";

  static String m2(userName) => "Good Evening ${userName}!";

  static String m3(userName) => "Good Morning ${userName}!";

  static String m4(userName) => "Good Night ${userName}!";

  static String m5(seconds) => "Yêu cầu gửi mã mới trong ${seconds}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_description": MessageLookupByLibrary.simpleMessage(
            "Ứng dụng gọi video trực tuyến hoàn toàn miến phí"),
        "app_name": MessageLookupByLibrary.simpleMessage("OKILA"),
        "cancelled": MessageLookupByLibrary.simpleMessage("Cancelled"),
        "close": MessageLookupByLibrary.simpleMessage("Đóng"),
        "code_1000":
            MessageLookupByLibrary.simpleMessage("Lỗi không xác định."),
        "code_1001": MessageLookupByLibrary.simpleMessage(
            "Email hoặc mật khẩu không đúng."),
        "code_1002": MessageLookupByLibrary.simpleMessage(
            "Tài khoản mạng xã hội không đúng."),
        "code_1003": MessageLookupByLibrary.simpleMessage(
            "Số điện thoại chưa được đăng ký."),
        "code_1004": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu không được để trống."),
        "code_1005":
            MessageLookupByLibrary.simpleMessage("Email không được để trống."),
        "code_1006": MessageLookupByLibrary.simpleMessage("Email đã tồn tại."),
        "code_1007": MessageLookupByLibrary.simpleMessage(
            "Tài khoản mạng xã hội đã tồn tại."),
        "code_1008": MessageLookupByLibrary.simpleMessage(
            "Số điện thoại không được để trống."),
        "code_1009":
            MessageLookupByLibrary.simpleMessage("Số điện thoại đã tồn tại."),
        "code_1010": MessageLookupByLibrary.simpleMessage(
            "Mã nhân viên không được để trống."),
        "code_1011":
            MessageLookupByLibrary.simpleMessage("Dung lượng file quá lớn."),
        "code_1012": MessageLookupByLibrary.simpleMessage(
            "Tải lên tệp không thành công."),
        "code_1013": MessageLookupByLibrary.simpleMessage(
            "Không hỗ trợ loại tệp tin này."),
        "code_1014":
            MessageLookupByLibrary.simpleMessage("Thiết bị không được hỗ trợ."),
        "code_1015": MessageLookupByLibrary.simpleMessage(
            "Định dạng số điện thoại không đúng."),
        "code_1016":
            MessageLookupByLibrary.simpleMessage("Định dạng email không đúng."),
        "code_1017": MessageLookupByLibrary.simpleMessage(
            "Không tìm thấy người dùng này."),
        "code_1018":
            MessageLookupByLibrary.simpleMessage("Dữ liệu không đúng."),
        "code_1019": MessageLookupByLibrary.simpleMessage("Mã hết hạn."),
        "code_1020": MessageLookupByLibrary.simpleMessage("Mã không đúng."),
        "code_1021": MessageLookupByLibrary.simpleMessage(
            "Nhậm sai quá số lần cho phép."),
        "code_200": MessageLookupByLibrary.simpleMessage("Thành công."),
        "code_401": MessageLookupByLibrary.simpleMessage("Cần đăng nhập."),
        "code_403": MessageLookupByLibrary.simpleMessage("Cần đăng nhập."),
        "code_404": MessageLookupByLibrary.simpleMessage(
            "Máy chủ đang bận. Vui lòng quay lại sau."),
        "code_417": MessageLookupByLibrary.simpleMessage("Expectation failed."),
        "code_500": MessageLookupByLibrary.simpleMessage("Thất bại."),
        "connect_timeout": MessageLookupByLibrary.simpleMessage(
            "Thời gian kết nối kéo dài. Vui lòng thử lại"),
        "connection_problem": MessageLookupByLibrary.simpleMessage(
            "Có một số vấn đề với kết nối. Vui lòng thử lại"),
        "database_exception": MessageLookupByLibrary.simpleMessage(
            "Đang có vấn đề về dữ liệu. Vui lòng quay lại sau."),
        "enter_verify_code": MessageLookupByLibrary.simpleMessage(
            "Nhập mã gồm 6 chữ số đã gửi tới"),
        "enters_code_incorrect": m0,
        "find_dial_code": MessageLookupByLibrary.simpleMessage("Tìm mã vùng"),
        "good_afternoon": m1,
        "good_evening": m2,
        "good_morning": m3,
        "good_night": m4,
        "have_not_received_verify_code":
            MessageLookupByLibrary.simpleMessage("Chưa nhận được mã?"),
        "invalid_credentials":
            MessageLookupByLibrary.simpleMessage("Invalid credentials"),
        "login": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
        "next": MessageLookupByLibrary.simpleMessage("Tiếp"),
        "or_register_now":
            MessageLookupByLibrary.simpleMessage("Hoặc đang ký ngay"),
        "phone_number_hint": MessageLookupByLibrary.simpleMessage("9876543210"),
        "phone_number_is_not_empty": MessageLookupByLibrary.simpleMessage(
            "Số điện thoại không được để trống"),
        "please_check_internet_connection":
            MessageLookupByLibrary.simpleMessage(
                "Làm ơn kiểm tra kết nối mạng."),
        "provide_phone_number_registered_before":
            MessageLookupByLibrary.simpleMessage(
                "Bạn hãy dùng số điện thoại đã được đăng ký để thực hiện đăng nhập."),
        "reason_provide_phone_number": MessageLookupByLibrary.simpleMessage(
            "Bạn sẽ cần số điện thoại để xác thực thông tin và đăng nhập vào ứng dụng."),
        "receive_timeout": MessageLookupByLibrary.simpleMessage(
            "Thời gian kết nối kéo dài. Vui lòng thử lại"),
        "register": MessageLookupByLibrary.simpleMessage("Đăng ký"),
        "request": MessageLookupByLibrary.simpleMessage("Gửi yêu cầu"),
        "request_new_code":
            MessageLookupByLibrary.simpleMessage("Yêu cầu gửi mã mới"),
        "request_new_code_in_seconds": m5,
        "requested_new_code": MessageLookupByLibrary.simpleMessage(
            "Yêu cầu gửi mã mới thành công!"),
        "send_timeout": MessageLookupByLibrary.simpleMessage(
            "Thời gian kết nối kéo dài. Vui lòng thử lại"),
        "server_error": MessageLookupByLibrary.simpleMessage("Lỗi."),
        "server_not_found": MessageLookupByLibrary.simpleMessage(
            "Không kết nối được với máy chủ. Vui lòng quay lại sau."),
        "server_unknown_error": MessageLookupByLibrary.simpleMessage(
            "Máy chủ đang gặp vấn đề. Vui lòng quay lại sau."),
        "unknown_error":
            MessageLookupByLibrary.simpleMessage("Lỗi không xác định."),
        "what_is_phone_number": MessageLookupByLibrary.simpleMessage(
            "Chào mừng bạn! Số điện thoại của bạn là gì?")
      };
}
