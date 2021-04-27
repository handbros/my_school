class StringFormatter {
  /// 'YYYYMMDDHHmmss'와 같은 문자열을 'YYYYMMDDTHHmmss로 변환해줍니다.
  String formatToParsableDateTime(String text) {
    if (text.length >= 14) {
      var result = text.substring(0, 8) + "T" + text.substring(8, 14);
      return result;
    }
    else {
      return text;
    }
  }
}