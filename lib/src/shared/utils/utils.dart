class Utils {
  Utils._();
  static String isoToEmoji(String code) {
    return code
        .split('')
        .map((letter) =>
            String.fromCharCode(letter.codeUnitAt(0) % 32 + 0x1F1E5))
        .join('');
  }

  static String getFlagImageAssetPath(String isoCode) {
    return "assets/${isoCode.toLowerCase()}.png";
  }
}