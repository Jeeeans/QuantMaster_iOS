//
//  QuantSelectView.swift
//  QuantMaster
//
//  Created by 진성준 on 9/4/24.
//

import SwiftUI
import ComposableArchitecture

struct QuantSelectView: View {
    @Bindable var store: StoreOf<QuantSelectFeature>
    @ObservedObject var indexManager = IndexManager()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Condition")
            HStack {
                Picker("", selection: $store.selectedOption) {
                    ForEach(self.store.data, id: \.self) { item in
                        Text(item.title).tag(item)
                    }
                }
                .listRowSeparator(.visible)
                .pickerStyle(.menu)
                
                Button("", systemImage: "xmark.circle") {
                    store.send(.deleteButtonTapped)
                }
                .background(.clear)
                
            }
            HStack {
                TextField("하윗값", text: $store.lowerValue)
                    .textFieldStyle(.roundedBorder)
                    .padding(8)
                
                Picker("", selection: $store.lowerOption) {
                    ForEach(CompareType.allCases, id: \.self) { type in
                        Text(type.description)
                    }
                }
            }
            HStack {
                TextField("상윗값", text: $store.higherValue)
                    .textFieldStyle(.roundedBorder)
                    .padding(8)
                
                Picker("", selection: $store.higherOption) {
                    ForEach(CompareType.allCases, id: \.self) { type in
                        Text(type.description)
                    }
                }
            }
            Picker("", selection: $store.orderOption) {
                ForEach(OrderType.allCases, id: \.self) { type in
                    Text(type.description)
                }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
    
}

#Preview {
    QuantSelectView(store: Store(initialState: QuantSelectFeature.State(
        data: TestData.selectConditionModel),
                                 reducer: {
        QuantSelectFeature()
            }
    ))
}
