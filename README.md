# VitalTracker SDK for Android

This library allows you to integrate VitalTracker into your Android app.<br/>
VitalTracker SDK를 안드로이드 앱에 탑재하여 생체지표를 추출할 수 있도록 지원합니다.<br/>
Remote PPG 기술을 이용하여 5가지의 생체 지표인 심박수, 스트레스, 호흡수, 산소포화도, 혈압을 측정할 수 있습니다.<br/>

<br/>

# FEATURES
* 원활한 동작을 위해 아래의 환경을 지원해야 합니다.<br/>
  |항목|세부내용|
  |------|---|
  |OS|iOS 13.0 이상|
  |카메라|전면카메라|
  |CPU|Arm64 (64bit)|
  |촬영시 권장사항|주변이 너무 심하게 어둡지 않아야 함. 촬영 시 움직임 및 빛 변화가 없어야 함.|

<br/>

# STRUCTURE
Vital Tracker의 제품은 Mobile용 SDK와 생체지표를 분석하는 서버로 구성됩니다.<br/>
이 SDK는 Mobile SDK 중 iOS의 서비스 앱에 탑재하기 위한 모듈입니다.<br/>
생체지표 분석 서버는 별도의 구축이 필요하며 서비스앱에서 연동이 필요합니다.<br/>

 ![sdk library settings](https://github.com/bioconnect/filestorage/blob/main/service_structure.png)

 <br/>

 # USAGE
* 동작 시나리오  
  -	앱 동작 -> 카메라 권한 요청 -> 얼굴 감지 -> 측정 버튼 활성화 -> 측정 버튼 누름 및 측정 (15초) -> 생체지표 분석 서버와 통신 -> 측정 결과 출력

 <br/>

 # INSTALLATION
 VitalTracker SDK를 iOS 앱에 적용/설치 하기 위한 과정을 설명합니다.<br/>

1. 빈 프로젝트 생성.<br/>

2. Podfile 생성.<br/>
   1) 프로젝트 경로로 이동.<br/>
   2) "pod init" 명령어를 통해 Podfile 생성.<br/>
   3) 편집기를 이용하여 Podfile를 수정 - pod "OpenCV" 추가.<br/>
      ![image](https://github.com/HKYoung93/vitaltracker_sdk_for_ios/assets/150203489/0ca8de19-44dc-403d-a4ec-9529add9a5a9)
      <br/>
   5) "pod install" 명령어를 통해 OpenCV library 추가.<br/>
  
3. XCFramework 적용<br/>
   1) XCFramework를 사용할 프로젝트의 “TARGETS” 밑 “General”로 이동.<br/>
   2) “Frameworks, Libraries, and Embedded Content”에서 “+” 추가 버튼 클릭.<br/>
<img width="687" src="https://github.com/HKYoung93/vitaltracker_sdk_for_ios/assets/150203489/561611f4-459e-42ef-aa80-07b95d13ee32"><br/>
   3) “Add Others”를 클릭하여 XCFramework가 있는 경로로 이동 및 열기.<br/>
<img width="408" src="https://github.com/HKYoung93/vitaltracker_sdk_for_ios/assets/150203489/f047a6dd-1c8f-4d87-b7ef-e932eff6154a">
<br/>
<img width="808" src="https://github.com/HKYoung93/vitaltracker_sdk_for_ios/assets/150203489/76517a8b-af33-4c0e-ab11-1ef8f58bbd85">
<br/>
<img width="687" src="https://github.com/HKYoung93/vitaltracker_sdk_for_ios/assets/150203489/3d3fa053-e3cf-4e68-b620-674816d45393">
<br/>
4. 권한 설정<br/>
  <br/>
  바이오커넥트 SDK는 카메라를 이용한 frame 분석을 진행하기 때문에 카메라에 대한 접근 권한이 필요합니다. 또한, 바이오커넥트 SDK를 통하여 추출된 데이터를 분석하기 위해 바이오커넥트 자사 내 서버에서 운영중인 python code 실행. 바이오커넥트 자사 내 서버와 HTTP 주소를 통해 통신하고 있지만, iOS9 이후로 Apple 측에서 ATS를 통한 HTTP 접속을 제한하고 있습니다. 이를 해결하기 위해 iOS App의 Info에서 권한 설정을 해야합니다. <br/>
  <br/>
  1) Project “TARGETS”의 “Info” tab으로 이동.<br/>
  <img width="888" src="https://github.com/HKYoung93/vitaltracker_sdk_for_ios/assets/150203489/fef48d7a-5b87-4037-afc4-c75f3990a63e"><br/>
  2) 카메라 권한 추가.<br/>
  “Privacy - Camera Usage Description” 추가.<br/>
  <img width="616" src="https://github.com/HKYoung93/vitaltracker_sdk_for_ios/assets/150203489/46bf265f-c26a-476e-95e5-8970ecae8718"><br/>
  3) HTTP 접근 허용.<br/>
    - “App Transport Security Settings” 추가.<br/>
    - “App Transport Security Settings” 아래에 “Allow Arbitrary Loads” 추가.<br/>
    - “Allow Arbitrary Loads”의 “Value”를 Yes로 변경.<br/>
    <img width="608" src="https://github.com/HKYoung93/vitaltracker_sdk_for_ios/assets/150203489/98083f11-f64f-472e-bc50-f20dc160f55d">
