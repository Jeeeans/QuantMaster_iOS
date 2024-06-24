//
//  ConditionListFeature.swift
//  QuantMaster
//
//  Created by 진성준 on 9/12/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct ConditionListFeature {
    
    @ObservableState
    struct state: Equatable {
        var count: Int = 0
        
    }
    enum Action {
        case addConditionButtonTapped
        case removeConditionButtonTapped
        case backTestingButtonTapped
    }
}


