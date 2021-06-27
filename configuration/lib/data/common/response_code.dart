class ResponseCode {
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
