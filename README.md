# 워키토키

## 들어가기

WorkeyDockey *프론트엔트* 개발자용 Project 입니다.

이 프로젝트는 Flutter 기술을 사용합니다.

## 사용 방법

**단계 1:**

아래 링크를 사용하여 이 리포지토리를 복제하세요:

```
https://github.com/workey-dockey/workey-dockey-client.git
```

**단계 2:**

프로젝트 루트로 이동하고 콘솔에서 다음 명령을 실행하여 필요한 dependency들을 가져오세요:

```
flutter pub get
```

**단계 3:**

이 프로젝트는 코드 생성과 함께 작동하는 `freezed` 라이브러리를 사용합니다. 파일을 생성하려면 다음 명령을 실행하세요:

```
dart run build_runner build --delete-conflicting-outputs
```

또는 소스 코드를 자동으로 동기화하기 위해 watch 명령을 사용하세요:

```
dart run build_runner watch
```

## 생성된 파일 숨기기

생성된 파일을 숨기려면 `Android Studio` -> `Preferences` -> `Editor` -> `File Types`로 이동한 다음 아래 줄을 `ignore files and folders` 섹션에 붙여넣으세요:

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:

```
*.freezed.dart;*.g.dart;
```

Visual Studio Code에서는 `Preferences` -> `Settings`로 이동하여 `Files:Exclude`를 검색하세요. 다음 패턴을 추가하세요:
```
**/*.freezed.dart
**/*.g.dart
```

## 공통 코딩 스타일

기본 Flutter lint 스타일을 따릅니다.

### Dart analyzer 실행하기

아래와 같이 실행합니다.
참고로 Dart analyzer 는 Android studio Flutter 플러그인을 설치했다면 이미 편집기에서 실시간으로 실행되고 있습니다.
편집기의 Warning 을 부지런히 제거했다면 analyzer 를 실행하더라도 아마 큰 문제를 발견하진 않을 겁니다.

```
$ flutter analyze
Analyzing client...

No issues found! (ran in 1.1s)
```

## 워키도키 기능:
* Auth
* Home
* User
* Schedule
* WorkReport

### 사용되는 라이브러리 및 도구

* [Riverpod](https://pub.dev/packages/flutter_riverpod) (상태 관리)
* [Firestore](https://pub.dev/packages/cloud_firestore) (원격 데이터베이스)
* [Freezed](https://pub.dev/packages/freezed)
* [GoRouter](https://pub.dev/packages/go_router)

### 프로젝트 아키텍쳐
이 프로젝트는 아래의 아키텍쳐를 적용합니다.
- [Riverpod Architecture](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/)
- [Flutter Project Structure](https://codewithandrea.com/articles/flutter-project-structure/) 의 Feature-first

### 폴더 구조

이 프로젝트에서 사용하는 폴더 구조는 다음과 같습니다.

```
lib/
|- common
  |- constants/
  |- exceptions/
  |- utils/
  |- widgets/
  |- routes.dart
|- features/
  |- auth/
  |- schedule/
  |- user/
  |- work/
|- main.dart
```

먼저 main.dart 파일을 살펴봅시다.

```
main.dart - 이 파일은 앱의 시작점입니다. 앱 수준의 모든 구성이 여기에 정의됩니다. 예를 들어, 테마, 경로, 제목, 상태관리 설정 등이 포함됩니다.
```

이제 앱에서 공유되는 코드를 포함하는 common 폴더로 들어가 봅시다.

```
1- constants - 해당 디렉토리에는 응용 프로그램 수준의 모든 상수가 해당 파일 내에서 정의됩니다. 이 디렉토리에는 `테마`, `숫자 단위`, `API 엔드포인트`, `환경 설정` 및 `문자열`에 대한 상수가 포함됩니다.
2- exceptions - 프로젝트의 모든 예외 처리가 포함됩니다.
3- util — 앱의 유틸리티/일반 함수가 포함됩니다.
4- widgets — 응용 프로그램의 공통 위젯이 포함됩니다. 예를 들어, Button, TextField 등이 있습니다.
5- routes.dart — 이 파일에는 앱의 모든 경로가 포함됩니다.
```

### features

앱에서 제공하는 모든 기능은 도메인별로 구분되어 이 디렉터리에 들어갑니다. 하위 디렉터리로 presentation, domain, data 레이어를 필수로 포함하며, 여러 비즈니스 로직을 사용할 경우 application 레이어를 선택적으로 사용할 수 있습니다.

```
features/
  |- user
    |- presentation/
        |- users_screen.dart
        |- user_item.dart
        |- user_controller.dart
      
    |- domain/
        |- user.dart
        |- user_extensions.dart
        
    |- data
        |- user_repository.dart

    |- application
        |- user_service.dart
```

presentaion 레이어에 다수의 화면과 위젯이 포함될 경우 screens, widgets, state 하위 디렉터리로 구분하면 가독성이 좋아집니다

```
features/
  |- user
    |- presentation/
        |- screens/
            |- users_screen.dart
            |- add_user_screen.dart
        |- widgets/
            |- user_item.dart
            |- payment_button.dart
        |- state/
            |- user_controller.dart
      
    |- domain/
        |- user.dart
        |- user_extensions.dart
        
    |- data
        |- user_repository.dart

    |- application
        |- user_service.dart
```