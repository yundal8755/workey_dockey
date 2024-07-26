
<h1 style="text-align: center;">워키도키 - 자영업자를 위한 근태관리 서비스</h1>

<table style="margin: 0 auto;">
  <tr>
    <td style="padding: 0 20px;">
      <img width="240" src="https://velog.velcdn.com/images/yun_dal/post/aedd441a-ba13-44a1-82f7-6d978fde944f/image.png" />
    </td>
    <td style="padding: 0 20px;">
      <img width="240" src="https://velog.velcdn.com/images/yun_dal/post/d49adae4-0e3c-4ddb-aa75-d45f4f6f741e/image.png" />
    </td>
    <td style="padding: 0 20px;">
      <img width="240" src="https://velog.velcdn.com/images/yun_dal/post/d645d803-f381-46c6-aca5-cbd4a34d9eae/image.png" />
    </td>
  </tr>
</table>
</br>

### 앱 소개
- 피고용인 정보와 근무 일정을 손쉽게 관리하는 자영업자를 위한 앱 서비스


### 주요 기능
- `역할 생성 및 관리`: 피고용인의 역할을 생성하거나 불러오기, 수정, 삭제 가능
- `근무 일정 생성 및 관리`: 새로운 일정을 생성하거나 기존의 일정을 읽기, 수정, 삭제 가능
- `일정 상태 공유`: 홈 화면에서 다가오는 일정, 진행중인 일정 데이터를 비동기적으로 불러옴
- `특정 시점의 일정 확인`: 특정 시점의 일정을 조회하고 싶을 때 캘린더로 날짜 선택시 일정 확인 가능

<br></br>


# 목차
- [요약](#요약)
- [구현 내용](#구현-내용)
- [폴더 구조](#폴더-구조)
- [프로젝트 특징](#프로젝트-특징)
- [프로젝트 문서 및 회고록](#프로젝트-문서-및-회고록)
<br></br>


# 요약

| Index                | Detail                                                  |
|----------------------|---------------------------------------------------------|
| 진행 기간            | 2024.05.18 ~ 진행중                                  |
| 프로젝트 유형            | 팀 프로젝트 - Flutter 개발자 4명                            |
| 역할                 | 기능 개발 (홈, 일정 관리), 기획(공통)                           |
| 사용된 핵심 패키지   | Riverpod(상태관리), go_Router(라우팅), firebase_core |
| IDE                  | Visual Studio Code 1.89.1                               |
| Flutter SDK          | 3.22.1 (stable)                                         |
| Dart SDK             | 3.4.1                                                   |
| DevTools             | 2.34.3                                                  |
| 디바이스             | iPhone 12 pro (iOS 17.4.1)          |
| 테스트 환경          | macOS Monterey(14.0)                                  |
| 기능                 | - Firebase Authentication Google, Apple, kakao 로그인 <br> - 피고용인 역할 생성 및 관리 <br> - 근무 일정 생성 및 관리 <br> - 캘린더를 통해 특정 시점의 일정 확인 기능 |


# 구현 내용

| 홈 페이지 | 일정 관리 페이지 | 근무 일정 추가 페이지 |
|:--------------------------:|:--------------------------:|:--------------------------:|
| ![](https://velog.velcdn.com/images/yun_dal/post/a83e20fb-ec63-4d20-b1f2-c7ac20f7ff2c/image.png) | ![](https://velog.velcdn.com/images/yun_dal/post/9bdc25e8-4e10-4303-bf70-d44ae656c95d/image.png) | ![](https://velog.velcdn.com/images/yun_dal/post/bf2bf33e-0ab8-4745-8aa6-6b293a295cbc/image.png) |

| 날짜 선택 Dialog | 역할 선택 모달창 | 역할 관리 페이지 |
|:--------------------------:|:--------------------------:|:--------------------------:|
| ![](https://velog.velcdn.com/images/yun_dal/post/b2427582-e4e4-459b-9eed-6acbff1c8d36/image.png) | ![](https://velog.velcdn.com/images/yun_dal/post/57c41f9f-2c01-4a9f-afc6-730faec8eae7/image.png) | ![](https://velog.velcdn.com/images/yun_dal/post/e39dceda-f732-45a3-9313-7dc61ed81d34/image.png) |




# 폴더 구조

```bash
 |-- lib
     |-- common
     |   |-- constants
     |   |-- exceptions
     |   |-- layout
     |   |-- theme
     |   |-- utils
     |   |-- widgets
     |-- features
     |   |-- home
     |   |   |-- data
     |   |   |   |-- repository
     |   |   |-- domain
     |   |   |   |-- model
     |   |   |-- presentation
     |   |   |   |-- screen
     |   |   |   |-- state
     |   |   |   |-- widget
     |   |-- schedule
     |   |   |-- data
     |   |   |   |-- repository
     |   |   |-- domain
     |   |   |   |-- model
     |   |   |-- presentation
     |   |   |   |-- screen
     |   |   |   |-- state
     |   |   |   |-- widget
     |   |   |   |   |-- app_bar
     |   |   |   |   |-- bottom_sheet
     |   |   |   |   |-- button
     |   |   |   |   |-- item_tile
     |   |   |   |   |-- select_tile
     |   |   |   |   |-- tile
 |
```
<br></br>


# 프로젝트 특징
### Clean-Architecture 적용
- 코드의 결합도를 낮추기 위해 Clean-Architecture 도입
  - Clean-Architecture를 도입한 이유는 계층을 세분화하여 역할을 분리함으로써, 코드의 결합도를 낮추기 위해서입니다.
  - Presentation: screen과 widget 그리고 상태를 관리하는 state 폴더로 구분하여 코드의 가독성을 높였습니다.
  - Domain: 모델 객체를 JSON으로 직렬화한 파일들로 구성하여 데이터의 일관성과 무결성을 유지했습니다.
  - Data: 주로 Firestore와 소통하는 repository 파일로 구성하여 데이터 관리의 효율성을 높였습니다.
- Notifier 일관성을 부여하기 위해 Riverpod의 StateNotifier로 데이터 바인딩 방식을 통일
  - StateNotifier를 선택한 이유는 불필요한 리빌드를 줄여 성능을 최적화할 수 있기 때문입니다. 
  - 또한, 의존성 주입을 통해 비즈니스 로직과 상태 관리를 분리함으로써 코드의 재사용성을 높일 수 있기 때문입니다.

</br>

# 프로젝트 문서 및 회고록
- <a href="https://equable-jitterbug-e9a.notion.site/c1823304fc964ad7862b25fb79d4f262?v=b75b8d61fb7c4d258215b38d5f97dc92">워키도키 개발일지</a>
<br></br>
