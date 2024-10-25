//
//  QuantResultFeature.swift
//  QuantMaster
//
//  Created by 진성준 on 10/15/24.
//

import ComposableArchitecture

@Reducer
struct QuantResultFeatures {
    
    @ObservableState
    struct State {
        var results: QuantResultModel?
    }
    
    enum Action {
        case fetchResult
        
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .fetchResult:
                return .none
            }
        }
    }
}
