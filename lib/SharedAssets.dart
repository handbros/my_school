class SharedAssets {
  // 싱글톤 패턴 구현을 위한 정적 클래스.
  static final SharedAssets _instance = new SharedAssets._internal();

  factory SharedAssets() {
    return _instance;
  }

  SharedAssets._internal() {
    // 클래스 초기화 코드
  }

  String API_KEY = "d3907f38622249d18ac04d71b9b30640";
  String API_DOMAIN = "open.neis.go.kr";
  String ACADEMY_API_PATH = "/hub/acaInsTiInfo";
}