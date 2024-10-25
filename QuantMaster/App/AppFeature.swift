//
//  AppFeature.swift
//  QuantMaster
//
//  Created by 진성준 on 9/22/24.
//

import ComposableArchitecture
import Foundation
import Combine

@Reducer
struct AppFeature {
    
    var service: AppService = AppService()
    var cancellables = Set<AnyCancellable>()
    
    @ObservableState
    struct State {
        var appInfo: AppInfo?
    }
    
    enum Action {
        case fetchAppInfo
        case appInfoResponse(AppInfo?)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .fetchAppInfo:
                return .publisher {
                    self.service.fetchAppInfo()
                        .map { .appInfoResponse($0) }
                        .catch { _ in Just(.appInfoResponse(nil)) }
                }
            case .appInfoResponse(let appInfo):
                state.appInfo = appInfo
                return .none
            }
        }
    }
}

struct AppService {
    
    func fetchAppInfo() -> AnyPublisher<AppInfo, Error> {
        return CommonClient.shared.sendGet(path: "", parameters: nil)
    }
}
