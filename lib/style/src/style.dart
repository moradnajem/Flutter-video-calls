part of style;

void setStyleDefault() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: mColorNavigationBar,
      systemNavigationBarIconBrightness: Brightness.light));
}

final mPrimaryTextStyle = TextStyle(
  fontFamily: "Product Sans",
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
  fontSize: mSizePrimaryText,
  color: mColorTextSecondary,
);

final mTitleStyle = TextStyle(
  fontFamily: "Product Sans",
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
  fontSize: mSizeH2,
  color: mColorTextTitle,
);

final mHintStyle = TextStyle(
  fontFamily: "Product Sans",
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
  fontSize: mSizeTextField,
  color: mColorTextHint,
);

final mTextFieldStyle = TextStyle(
  fontFamily: "Product Sans",
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
  fontSize: mSizeTextField,
  color: mColorTextSecondary,
);

final mActionTextStyle = TextStyle(
  fontFamily: "Product Sans",
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: mSizeTextAction,
  color: mColorTextTitle,
);
