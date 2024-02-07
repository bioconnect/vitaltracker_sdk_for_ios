//
//  ContentView.swift
//  demo
//
//  Created by 김학영 on 11/30/23.
//

import SwiftUI
import BioConnectSDK
import UIKit

struct ContentView: View {
    @EnvironmentObject var measureViewModel: MeasurementViewModel
    @EnvironmentObject var viewModel: SDKViewModel
    @State private var SDKView = false
        
    // 나머지 속성들
    // 비동기 작업을 수행하는 함수
    func performTask() {
        Task {
            do {
                // 비동기 작업 내용
//                print("결과 출력 : ", measureViewModel.result["BP"]!)
                print("화면 가로 : ", UIScreen.main.bounds.width)
                print("화면 세로 : ", UIScreen.main.bounds.height)
            }
        }
    }
    var body: some View {
        // 나머지
        VStack {
            Button {
                // 클릭 시 비동기 작업 수행
                performTask()
            } label: {
                Text("결과 확인하기")
            }
        }
        Spacer().frame(height : 50)

        VStack {
            Button(action: {
                // 버튼을 눌렀을 때 ABC 뷰를 보여줌
                SDKView.toggle()
            }) {
                Text("Show SDKView")
                    .fullScreenCover(isPresented: $SDKView, content: {
                        BioConnectSDKView()
                    })
            }
//            .sheet(isPresented: $SDKView) {
//                BioConnectSDKView() // ABC 뷰를 시트로 보여줌
//            }
        }
    }
}

@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(
                    MeasurementViewModel(baseURL: "http://118.128.153.171:8088", //서버주소 입력
                                         showResultTable: true, // 측정 결과 Table cnffur
                                         measureTimer: 15 // 측정 시간 설정(초)
                ))  // MeasurementViewModel 초기화 및 주입
                .environmentObject(SDKViewModel())  // SDKViewModel 초기화 및 주입
        }
    }
}
