# VitalTracker SDK for iOS

This library allows you to integrate VitalTracker into your iOS app.<br/>
VitalTracker SDK를 iOS 앱에 탑재하여 생체지표를 추출할 수 있도록 지원합니다.<br/>
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
   ![sdk library settings](https://github.com/bioconnect/filestorage/blob/2b2c3a7e308573a9d3cdebc1fc7debb319317f0d/VitalTraker_SDK_iOS/VitalTracker_iOS_Readme_podfile%E1%84%89%E1%85%AE%E1%84%8C%E1%85%A5%E1%86%BC.png)   <br/>
   5) "pod install" 명령어를 통해 OpenCV library 추가.<br/>
  
3. XCFramework 적용<br/>
   1) XCFramework를 사용할 프로젝트의 “TARGETS” 밑 “General”로 이동.<br/>
   2) “Frameworks, Libraries, and Embedded Content”에서 “+” 추가 버튼 클릭.<br/>
<img width="687" src="https://github.com/bioconnect/filestorage/blob/2b2c3a7e308573a9d3cdebc1fc7debb319317f0d/VitalTraker_SDK_iOS/VitalTracker_iOS_Readme_framework%E1%84%8E%E1%85%AE%E1%84%80%E1%85%A1.png"><br/>
   3) “Add Others”를 클릭하여 XCFramework가 있는 경로로 이동 및 열기.<br/>
<img width="408" src="https://github.com/bioconnect/filestorage/blob/2b2c3a7e308573a9d3cdebc1fc7debb319317f0d/VitalTraker_SDK_iOS/VitalTracker_iOS_Readme_framework%E1%84%8E%E1%85%AE%E1%84%80%E1%85%A12.png">
<br/>
<img width="808" src="https://github.com/bioconnect/filestorage/blob/2b2c3a7e308573a9d3cdebc1fc7debb319317f0d/VitalTraker_SDK_iOS/VitalTracker_iOS_Readme_framework%E1%84%8E%E1%85%AE%E1%84%80%E1%85%A13.png">
<br/>
4. 권한 설정<br/>
  <br/>
  바이오커넥트 SDK는 카메라를 이용한 frame 분석을 진행하기 때문에 카메라에 대한 접근 권한이 필요합니다. 또한, 바이오커넥트 SDK를 통하여 추출된 데이터를 분석하기 위해 바이오커넥트 자사 내 서버에서 운영중인 python code 실행. 바이오커넥트 자사 내 서버와 HTTP 주소를 통해 통신하고 있지만, iOS9 이후로 Apple 측에서 ATS를 통한 HTTP 접속을 제한하고 있습니다. 이를 해결하기 위해 iOS App의 Info에서 권한 설정을 해야합니다. <br/>
  <br/>
  1) Project “TARGETS”의 “Info” tab으로 이동.<br/>
  <img width="888" src="https://github.com/bioconnect/filestorage/blob/2b2c3a7e308573a9d3cdebc1fc7debb319317f0d/VitalTraker_SDK_iOS/VitalTracker_iOS_Readme_%E1%84%80%E1%85%AF%E1%86%AB%E1%84%92%E1%85%A1%E1%86%AB%E1%84%89%E1%85%A5%E1%86%AF%E1%84%8C%E1%85%A5%E1%86%BC.png"><br/>
  2) 카메라 권한 추가.<br/>
  “Privacy - Camera Usage Description” 추가.<br/>
  <img width="616" src="https://github.com/bioconnect/filestorage/blob/2b2c3a7e308573a9d3cdebc1fc7debb319317f0d/VitalTraker_SDK_iOS/VitalTracker_iOS_Readme_%E1%84%8F%E1%85%A1%E1%84%86%E1%85%A6%E1%84%85%E1%85%A1%E1%84%80%E1%85%AF%E1%86%AB%E1%84%92%E1%85%A1%E1%86%AB%E1%84%89%E1%85%A5%E1%86%AF%E1%84%8C%E1%85%A5%E1%86%BC.png"><br/>
  3) HTTP 접근 허용.<br/>
    - “App Transport Security Settings” 추가.<br/>
    - “App Transport Security Settings” 아래에 “Allow Arbitrary Loads” 추가.<br/>
    - “Allow Arbitrary Loads”의 “Value”를 Yes로 변경.<br/>
    <img width="608" src="https://github.com/bioconnect/filestorage/blob/2b2c3a7e308573a9d3cdebc1fc7debb319317f0d/VitalTraker_SDK_iOS/VitalTracker_iOS_Readme_http%E1%84%8C%E1%85%A5%E1%86%B8%E1%84%80%E1%85%B3%E1%86%AB%E1%84%80%E1%85%AF%E1%86%AB%E1%84%92%E1%85%A1%E1%86%AB%E1%84%89%E1%85%A5%E1%86%AF%E1%84%8C%E1%85%A5%E1%86%BC.png">
<br/>
5. Activity에 적용<br/>
  1) 사용하려는 Activity에서 아래 소스 코드를 참조하여 개발하도록 합니다.<br/>
  2) SDK를 띄울 화면 View에 @EnvironmentObject를 선언해줍니다.<br/><br/>
  @EnvironmentObject var measureViewModel: MeasurementViewModel<br/>
  @EnvironmentObject var viewModel: SDKViewModel<br/><br/>
  3) View를 실행시킬 때 SDK에 전달할 파라미터를 설정하며 "MeasurementViewModel"와 "SDKViewModel"를 초기화시킵니다.<br/><br/>
  .environmentObject(MeasurementViewModel(baseURL (String): 측정지표 분석 서버의 Url ,<br/>
                       showResultTable (Bool): 측정 결과 및 에러를 View UI에 출력 여부,<br/>
                       measureTimer (Double): 측정 시간(초)
                ))
  .environmentObject(SDKViewModel())<br/><br/>
  <img width="581" alt="image" src="https://github.com/bioconnect/filestorage/blob/2b2c3a7e308573a9d3cdebc1fc7debb319317f0d/VitalTraker_SDK_iOS/VitalTracker_iOS_Readme_%E1%84%91%E1%85%A1%E1%84%85%E1%85%A1%E1%84%86%E1%85%B5%E1%84%90%E1%85%A5%E1%84%89%E1%85%A5%E1%86%AF%E1%84%8C%E1%85%A5%E1%86%BC.png"><br/>
  4) 측정 결과는 측정이 완료된 이후 measureViewModel.result에 저장됩니다.<br/>
     배열 형태로 저장되며, 스트레스는 "정상", "약한 스트레스", "강한 스트레스"로 출력됩니다.<br/>
     measureViewModel.result = 
     [("bpm", Int), //심박수
     ("RR", Int), //호흡 수
     ("BP", String), //혈압
     ("SpO2", Int), //산소포화도
     ("stressIndex", Int), //스트레스 지수
     ("stressToLevel", String)] //스트레스<br/><br/>
     결과 사용 예제 : measureViewModel.result["BP"]!<br/>
     <img width="518" alt="image" src="https://github.com/bioconnect/filestorage/blob/2b2c3a7e308573a9d3cdebc1fc7debb319317f0d/VitalTraker_SDK_iOS/VitalTracker_iOS_Readme_%E1%84%80%E1%85%A7%E1%86%AF%E1%84%80%E1%85%AA%E1%84%89%E1%85%A1%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%8B%E1%85%A8%E1%84%8C%E1%85%A6.png">

