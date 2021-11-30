# my_school

```
🚨NOTICE🚨
이 프로젝트는 더이상 유지보수되지 않습니다.
최신 커밋을 기준으로 권한 부여 작업을 담당하는 로직이 없어, 디버그 모드에서만 정상 작동하는 문제가 있으니 참고해주시기 바랍니다.  
```

## 개요
my_school(은)는 NEIS 교육 정보 개방 포털에서 제공하는 Open API을(를) 이용한 학교 정보 조회 기능을 제공합니다.

## 설명
my_school(은)는 Flutter을(를) 이용하여 제작된 크로스 플랫폼 애플리케이션이며, 특정 플랫폼에 의존적인 일부 기능을 제외한 모든 소스코드가 lib 폴더에 위치하고 있습니다.

아래는 lib 폴더 내에 존재하는 각 네임스페이스 또는 클래스에 대한 추가 설명이오니 참고해주시기 바랍니다.

 * apis : NEIS에서 제공하는 Open API을(를) 이용하기 위한 클래스들을 제공합니다.
 * notifiers : ChangeNotifierProvider을(를) 사용하기 위한 ChangeNotifier 클래스들을 제공합니다.
 * objects : 비즈니스 로직들을 처리하기 위해 필요한 모델 클래스들을 제공합니다. 확장자 앞에 '.g'가 붙어있는 파일들은 JSON 직렬화/역직렬화를 위해 필요한 파일들입니다.
 * pages : 사용자로부터 실제 입력을 받는 UI을(를) 구현합니다.
 * screens : 페이지 진입 전에 초기화 과정을 수행하는 StatefulWidget들을 제공합니다.
 * utilities : 다수의 클래스에서 사용하는 공통 로직들을 제공합니다.
 * widgets : 각 페이지에서 사용하는 UI 구성요소들을 제공합니다.

 * * *

 * SharedAssets.dart : 모든 클래스에서 사용하는 애플리케이션 내 공통 공유 자산을 제공합니다. 이 클래스는 Singleton 패턴으로 구현되었습니다.
 * main.dart : 애플리케이션의 진입점(Entry Point, EP)이자 모든 UI 구성요소들의 부모가 되는 MaterialApp이(가) 생성되는 클래스입니다.

## 기여
my_school은(는) 프로젝트에 대한 모든 기여를 환영합니다. 기여 전에는 반드시 master 브랜치의 [컨트리뷰팅 문서(CONTRIBUTING.md)](CONTRIBUTING.md)를 읽어주시기 바랍니다.

## 라이센스
이 프로젝트는 MIT 라이센스에 의거하여 공개 배포됩니다. 이 프로젝트에서 사용된 제 3자 라이브러리에 대해서는 master 브랜치의 [오픈소스 라이센스 문서(OPENSOURCES.md)](OPENSOURCES.md)를 참조해주시기 바랍니다.

## 연락처
이 프로젝트에 대한 문의 사항이 있다면 GitHub Issues(이)나 아래 연락처로 연락주시기 바랍니다.
 * e-mail : [junimiso04@naver.com](mailto:junimiso04@naver.com)
