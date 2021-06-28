import 'package:configuration/generated/l10n.dart';

class ResponseCode {
  static final listCode = <int, String>{
    SUCCESS: S.current.code_200,
    FAILED: S.current.code_500,
    VALIDATE_FAILED: S.current.code_401,
    UNAUTHORIZED: S.current.code_403,
    FORBIDDEN: S.current.code_404,
    EXPECTATION_FAILED: S.current.code_417,

    // Error
    SERVER_UNKNOWN_ERROR: S.current.code_1000,

    EMAIL_PASSWORD_NOT_CORRECT: S.current.code_1001,
    SOCIAL_PASSWORD_NOT_CORRECT: S.current.code_1002,

    PHONE_NUMBER_PASSWORD_NOT_CORRECT: S.current.code_1003,

    PASSWORD_IS_NULL_BLANK: S.current.code_1004,
    EMAIL_IS_NULL_BLANK: S.current.code_1005,

    EMAIL_IS_EXISTS: S.current.code_1006,
    SOCIAL_IS_EXISTS: S.current.code_1007,

    PHONE_NUMBER_IS_NULL_BLANK: S.current.code_1008,
    PHONE_NUMBER_IS_EXISTS: S.current.code_1009,

    CODE_NOT_CORRECT: S.current.code_1010,

    FILE_TOO_LARGE: S.current.code_1011,

    FILE_UPLOAD_FAIL: S.current.code_1012,

    UNSUPPORTED_MEDIA_TYPE: S.current.code_1013,

    UNSUPPORTED_DEVICE: S.current.code_1014,

    PHONE_NUMBER_WRONG_FORMAT: S.current.code_1015,

    EMAIL_WRONG_FORMAT: S.current.code_1016,

    USER_NOT_FOUND: S.current.code_1017,

    WARNING_DATA_FORMAT: S.current.code_1018,

    VERIFY_CODE_EXPIRE: S.current.code_1019,

    VERIFY_CODE_NOT_CORRECT: S.current.code_1020,

    WRONG_TOO_MANY_TIME: S.current.code_1021,
  };

  static const SUCCESS = 200;
  static const FAILED = 500;
  static const VALIDATE_FAILED = 404;
  static const UNAUTHORIZED = 401;
  static const FORBIDDEN = 403;
  static const EXPECTATION_FAILED = 417;

  // Error
  static const SERVER_UNKNOWN_ERROR = 1000;

  static const EMAIL_PASSWORD_NOT_CORRECT = 1001;
  static const SOCIAL_PASSWORD_NOT_CORRECT = 1002;

  static const PHONE_NUMBER_PASSWORD_NOT_CORRECT = 1003;

  static const PASSWORD_IS_NULL_BLANK = 1004;
  static const EMAIL_IS_NULL_BLANK = 1005;

  static const EMAIL_IS_EXISTS = 1006;
  static const SOCIAL_IS_EXISTS = 1007;

  static const PHONE_NUMBER_IS_NULL_BLANK = 1008;
  static const PHONE_NUMBER_IS_EXISTS = 1009;

  static const CODE_NOT_CORRECT = 1010;

  static const FILE_TOO_LARGE = 1011;

  static const FILE_UPLOAD_FAIL = 1012;

  static const UNSUPPORTED_MEDIA_TYPE = 1013;

  static const UNSUPPORTED_DEVICE = 1014;

  static const PHONE_NUMBER_WRONG_FORMAT = 1015;

  static const EMAIL_WRONG_FORMAT = 1016;

  static const USER_NOT_FOUND = 1017;

  static const WARNING_DATA_FORMAT = 1018;

  static const VERIFY_CODE_EXPIRE = 1019;

  static const VERIFY_CODE_NOT_CORRECT = 1020;

  static const WRONG_TOO_MANY_TIME = 1021;
}
