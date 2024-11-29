# QR Code Scanner with WebView

QR 코드를 스캔하고 웹뷰로 연결하고 데이터를 주고 받는 Application입니다.

## 요구사항

- Flutter: 3.16.0 이상
- Dart: 3.2.0 이상
- Android SDK: 19 이상
- iOS: 11.0 이상

## 주요 패키지

- mobile_scanner: QR 코드 스캔
- webview_flutter: 웹뷰 표시
- get: 상태관리 및 라우팅

## 설치

1. Flutter 환경 설정이 완료되어 있는지 확인합니다.
2. 프로젝트를 클론합니다:
bash
git clone [repository-url]
cd [project-name]
3. 종속성을 설치합니다:
bash
flutter pub get

## 실행 방법

개발 모드로 실행:
bash
flutter run

## 사용 방법

1. 앱을 실행하면 메인 화면에서 'mobile_scanner_package' 버튼이 표시됩니다.
2. 버튼을 클릭하면 QR 코드 스캐너가 실행됩니다.
3. 카메라로 QR 코드를 스캔하면:
   - 유효한 URL인 경우: 웹뷰로 해당 페이지가 열립니다.
   - 유효하지 않은 URL: 오류 메시지가 표시됩니다.
4. 스캔 완료 후 '다시 스캔하기' 버튼으로 새로운 QR 코드를 스캔할 수 있습니다.

## 권한 설정

### Android
`android/app/src/main/AndroidManifest.xml`에 추가:
xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.INTERNET" />


### iOS
`ios/Runner/Info.plist`에 추가:
xml
<key>NSCameraUsageDescription</key>
<string>QR 코드를 스캔하기 위해 카메라 접근 권한이 필요합니다.</string>


## 주의사항

- 카메라 권한을 반드시 허용해야 QR 코드 스캔이 가능합니다.
- 인터넷 연결이 필요합니다.
- Android SDK 19 이상, iOS 11.0 이상에서만 동작합니다.

## 문제해결

- 카메라가 작동하지 않을 경우: 앱 설정에서 카메라 권한을 확인하세요.
- 웹뷰 로딩 실패: 인터넷 연결을 확인하세요.
- 빌드 오류 발생 시: `flutter clean` 후 `flutter pub get` 실행
