//
//  QuantOptionPlusFeature.swift
//  QuantMaster
//
//  Created by 진성준 on 9/19/24.
//

import Foundation
import ComposableArchitecture


@Reducer
struct QuantOptionPlusFeature {
    
    @ObservableState
    struct State: Equatable {
        
    }
    
    enum Action {
        case plusButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .plusButtonTapped:
                return .send(.plusButtonTapped)
            }
        }
    }
}
