import 'package:my_school/objects/ResultCode.dart';

class StringFormatter {
  /// 문자열을 ResultCode로 변환합니다.
  static ResultCode stringToResultCode(String text) {
    ResultCode result;

    if (text == "INFO-000") {
      result = ResultCode.Okay;
    }
    else if (text == "INFO-200") {
      result = ResultCode.DataNotFound;
    }
    else if (text == "INFO-300") {
      result = ResultCode.BlockedKey;
    }
    else if (text == "ERROR-290") {
      result = ResultCode.InvalidKey;
    }
    else if (text == "ERROR-300") {
      result = ResultCode.MissingArguments;
    }
    else if (text == "ERROR-310") {
      result = ResultCode.ServiceNotFound;
    }
    else if (text == "ERROR-333") {
      result = ResultCode.InvalidArgumentType;
    }
    else if (text == "ERROR-336") {
      result = ResultCode.ExceededLimit;
    }
    else if (text == "ERROR-337") {
      result = ResultCode.ExceededTraffic;
    }
    else if (text == "ERROR-500") {
      result = ResultCode.ServerError;
    }
    else if (text == "ERROR-600") {
      result = ResultCode.DatabaseConnectionError;
    }
    else if (text == "ERROR-601") {
      result = ResultCode.SqlQueryError;
    }
    else {
      result = ResultCode.None;
    }

    return result;
  }

  /// 'YYYYMMDDHHmmss'와 같은 문자열을 'YYYYMMDDTHHmmss로 변환합니다.
  static String stringToParsableDateTimeString(String text) {
    if (text.length >= 14) {
      var result = text.substring(0, 8) + "T" + text.substring(8, 14);
      return result;
    }
    else {
      return text;
    }
  }

  /// 'Y', 'N', '*'을 bool 자료형으로 변환합니다.
  static bool stringToBool(String text) {
    if (text == "Y") {
      return true;
    }
    else {
      return false;
    }
  }

  /// HTML <br> 태그를 이스케이프 시퀀스를 이용한 줄 바꿈으로 변환합니다.
  static String lineBreakToEscapeSequence(String text) {
    return text.replaceAll(RegExp("<br/>"), "\n");
  }
}