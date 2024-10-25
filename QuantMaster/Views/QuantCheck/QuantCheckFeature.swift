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
    struct State {
        var data: QuantCheckConditionModel
        var selectedList: [QuantCheckConditionItemModel] = []
        
        init(data: QuantCheckConditionModel) {
            self.data = data
            self.selectedList = data.items
        }
    }
    
    enum Action {
        case addOption(QuantCheckConditionItemModel)
        case removeOption(QuantCheckConditionItemModel)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .addOption(let item):
                state.selectedList.append(item)
                return .none
            case .removeOption(let item):
                if let index = state.selectedList.firstIndex(where: { item.type == $0.type }) {
                    state.selectedList.remove(at: index)
                }
                return .none
            }
        }
    }
}
