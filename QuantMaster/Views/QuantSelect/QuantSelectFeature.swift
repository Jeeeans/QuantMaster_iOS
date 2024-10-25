//
//  QuantSelectFeature.swift
//  QuantMaster
//
//  Created by 진성준 on 9/12/24.
//

import Foundation
import ComposableArchitecture
import SwiftUI

@Reducer
struct QuantSelectFeature {
    
    @ObservableState
    struct State {
        var id: UUID = UUID()
        var data: [QuantSelectConditionModel] = []
        var selectedOption: QuantSelectConditionModel
        var lowerValue: String = ""
        var lowerOption: CompareType = .NONE
        var higherValue: String = ""
        var higherOption: CompareType = .NONE
        var orderOption: OrderType = .ASC
        
        init(data: [QuantSelectConditionModel]) {
            self.data = data
            self.selectedOption = data.first ?? QuantSelectConditionModel(title: "", type: "")
        }
    }
    
    enum Action {
        case change
        case deleteButtonTapped
        case delegate(Delegate)
        
        enum Delegate: Equatable {
            case delete(UUID)
            case change(QuantSelectConditionModel)
        }
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .change:
                return .send(.delegate(.change(state.selectedOption)))
            case .deleteButtonTapped:
                return .send(.delegate(.delete(state.id)))
            case .delegate(let delegate):
                
                return .none
            }
        }
    }
}
