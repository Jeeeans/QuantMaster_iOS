//
//  QuantCheckFeature.swift
//  QuantMaster
//
//  Created by 진성준 on 9/12/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct QuantCheckFeature {
    @ObservableState
    struct State: Equatable {
        var data: QuantOption
        var selectedList: IdentifiedArrayOf<QuantOptionItem>
    }
    enum Action {
        case addOption(QuantOptionItem)
        case removeOption(QuantOptionItem)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .addOption(let item):
                state.selectedList.append(item)
                return .none
            case .removeOption(let item):
                if let index = state.selectedList.firstIndex(where: { item.id == $0.id }) {
                    state.selectedList.remove(at: index)
                }
                return .none
            }
        }
    }
}
