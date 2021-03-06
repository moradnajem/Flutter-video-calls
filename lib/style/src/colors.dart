part of style;

final Color mColorPrimary = HexColor.fromHex("#325A00");
final Color mColorPrimaryLight = HexColor.fromHex("#228B22");

const Color mColorNavigationBar = Colors.black;
final Color mColorBackground = HexColor.fromHex('#F8FAFB');
final Color mColorStatusColor = HexColor.fromHex('#33354E');

final Color mColorScrim = HexColor.fromHex('#42312324');
final Color mColorPrimaryScrim = HexColor.fromHex("#FF312324");

final Color mColorTextSecondary = HexColor.fromHex("#ABABAB");
final Color mColorTextTitle = HexColor.fromHex("#838383");
final Color mColorTextHint = HexColor.fromHex("#BDBDBD");

final Color mColorBorder = HexColor.fromHex("#E8E8E8");

final Color mColorBlack = HexColor.fromHex("#000000");
final Color mDarkOrange = HexColor.fromHex("#FF8C00");
final Color mCallBackground = HexColor.fromHex("#312324");
final Color mBackgroundActionCall = HexColor.fromHex("#74948");
final Color mActionColor = HexColor.fromHex("#EC6465");

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
// transparent
// 100% — FF
// 95% — F2
// 90% — E6
// 85% — D9
// 80% — CC
// 75% — BF
// 70% — B3
// 65% — A6
// 60% — 99
// 55% — 8C
// 50% — 80
// 45% — 73
// 40% — 66
// 35% — 59
// 30% — 4D
// 25% — 40
// 20% — 33
// 15% — 26
// 10% — 1A
// 5% — 0D
// 0% — 00
