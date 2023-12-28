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
                print("결과 출력 : ", measureViewModel.result)
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
                
            }
            .sheet(isPresented: $SDKView) {
                BioConnectSDKView() // ABC 뷰를 시트로 보여줌
            }
        }
    }
}

@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(
                    MeasurementViewModel(baseURL: "http://118.128.153.171:8088",
                                         showResultTable: true,
                                         measureTimer: 17
                ))  // MeasurementViewModel 초기화 및 주입
                .environmentObject(SDKViewModel())  // SDKViewModel 초기화 및 주입
        }
    }
}
