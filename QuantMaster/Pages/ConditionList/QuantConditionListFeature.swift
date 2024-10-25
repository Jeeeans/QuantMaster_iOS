//
//  QuantConditionListFeature.swift
//  QuantMaster
//
//  Created by 진성준 on 9/12/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct QuantConditionListFeature {
    
    @ObservableState
    struct State {
        var count: Int = 0
        var data: QuantConditionsModel
        var checkItems: [QuantCheckFeature.State] = []
        @Presents var addSelectItem: QuantSelectFeature.State?
        var selectItems: [QuantSelectFeature.State] = []
        var addOption: QuantOptionPlusFeature.State = .init()
        
        init(data: QuantConditionsModel) {
            self.data = data
            
            self.checkItems = data.checkList.map { QuantCheckFeature.State(data: $0) }
        }
    }
    
    enum Action {
        case selectItemAction(PresentationAction<QuantSelectFeature.Action>)
        case checkItemAction(PresentationAction<QuantCheckFeature.Action>)
        case addSelectItemTapped
        case backTestingButtonTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .selectItemAction(.presented(.delegate(.change(let model)))):
//                state.selectItems.append(model)
//                state.selectItems = state.selectItems.removeFirst { $0.id == childState.id }
                return .none
            case .checkItemAction, .selectItemAction:
                return .none
            case .addSelectItemTapped:
                state.selectItems.append(QuantSelectFeature.State(data: state.data.selectList))
                return .none
            case .backTestingButtonTapped:
                return .none
            }
        }
        .ifLet(\.$addSelectItem, action: \.selectItemAction) {
            QuantSelectFeature()
        }
    }
}


