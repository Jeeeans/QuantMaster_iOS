//
//  QuantMasterApp.swift
//  QuantMaster
//
//  Created by 진성준 on 6/24/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct QuantMasterApp: App {
    
    var store: StoreOf<AppFeature> = .init(initialState: AppFeature.State(),
                                           reducer: { return AppFeature() })
    
    var body: some Scene {
        WindowGroup {
            Main(store: .init(initialState: MainFeature.State(),
                              reducer: { MainFeature(service: MainServiceTest()) })
            )
            .onAppear {
                store.send(.fetchAppInfo)
            }
        }
    }
}
