//
//  QuantConditionListView.swift
//  QuantMaster
//
//  Created by 진성준 on 9/6/24.
//

import SwiftUI
import ComposableArchitecture

struct QuantConditionListView: View {
    @Bindable var store: StoreOf<QuantConditionListFeature>
    
    var body: some View {
        ScrollView {
            LazyVStack(content: {
                ForEach(0..<store.checkItems.count, id: \.self) { index in
                    QuantCheckView(
                        store: .init(initialState: store.checkItems[index],
                                     reducer: { QuantCheckFeature() }))
                }
                
                ForEach(0..<store.selectItems.count, id: \.self) { index in
                    QuantSelectView(
                        store: .init(initialState: store.selectItems[index],
                                     reducer: { QuantSelectFeature() }))
                }
                
            })
            .toolbar {
                ToolbarItem {
                    Button {
                        self.store.send(.addSelectItemTapped)
                    } label: {
                        Image(systemName: "plus.rectangle")
                    }
                }
            }
        }
    }
}

#Preview {
    QuantConditionListView(
        store: .init(initialState: QuantConditionListFeature.State(
            data: QuantConditionsModel(selectList: TestData.selectConditionModel,
                                       checkList: TestData.checkConditionModel)
        ),
                     reducer: { QuantConditionListFeature() }
                    )
    )
}
