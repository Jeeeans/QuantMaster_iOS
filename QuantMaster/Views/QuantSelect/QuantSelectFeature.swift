//
//  QuantSelectFeature.swift
//  QuantMaster
//
//  Created by 진성준 on 9/12/24.
//

import Foundation
import ComposableArchitecture
import ComposableArchitectureMacros

@Reducer
struct QuantSelectFeature: ReducerProtocol {
    @ObservableState
    struct State: Equatable {
        var data: QuantOption
        var selectedOption: QuantOptionItem? = nil
        var lowerValue: String = ""
        var lowerOption: CompareType? = nil
        var higherValue: String = ""
        var higherOption: CompareType? = nil
        var orderOption: OrderType? = nil
    }
    enum Action {
        case selectOption(QuantOptionItem)
        case deleteButtonTapped
        
        case setLowerValue
    }
    
    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .selectOption(let item):
                state.selectedOption = item
                return .none
            case .deleteButtonTapped:
                return .none
            }
        }
    }
}
