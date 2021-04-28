/// Open API의 호출 결과를 나타냅니다.
enum ResultCode {
  /// NONE. 호출 결과가 없습니다.
  None,

  /// EXCEPTION. 예외가 발생하였습니다.
  Exception,

  /// INFO_000. 요청이 정상 처리되었습니다.
  Okay,

  /// INFO_200. 관리자에 의해 인증키 사용이 제한되었습니다.
  BlockedKey,

  /// INFO_300. 해당하는 데이터가 없습니다.
  DataNotFound,

  /// ERROR_290. 인증키가 유효하지 않습니다.
  InvalidKey,

  /// ERROR_300. 필수 값이 누락되었습니다.
  MissingArguments,

  /// ERROR_310. 서비스를 찾을 수 없습니다.
  ServiceNotFound,

  /// ERROR_333. 페이지 위치(pIndex) 혹은 페이지 당 신청 숫자(pSize)에 정수가 아닌 값이 입력되었습니다.
  InvalidArgumentType,

  /// ERROR_336. 페이지 당 신청 숫자(pSize)는 최대 1000 까지만 설정 가능합니다.
  ExceededLimit,

  /// ERROR_337. 일별 트래픽 제한을 초과했습니다.
  ExceededTraffic,

  /// ERROR_500. 서버 오류가 발생했습니다.
  ServerError,

  /// ERROR_600. 데이터베이스 연결 오류가 발생했습니다.
  DatabaseConnectionError,

  /// ERROR_601. SQL 쿼리 오류가 발생했습니다.
  SqlQueryError
}