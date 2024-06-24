//
//  QuantCheckView.swift
//  QuantMaster
//
//  Created by 진성준 on 9/6/24.
//

import SwiftUI
import ComposableArchitecture

struct QuantCheckView: View {
    @Bindable var store : StoreOf<QuantCheckFeature>
    
    @ObservedObject private var indexManager: IndexManager = IndexManager()
    
    var body: some View {
        Text(self.store.data.title)
            .font(.subheadline)
        
        Picker("", selection: self.$indexManager.index) {
            ForEach(self.store.data.items) { option in
                Text(option.title)
                    .font(.title)
                    .tag(self.store.data.items.firstIndex(of: option))
            }
        }
        .pickerStyle(.segmented)
        .onReceive(self.indexManager.publisher) { index in
            let item = store.data.items[index]
            self.store.send(.addOption(item))
        }
        
    }
}

#Preview {
    QuantCheckView(store: Store(initialState: QuantCheckFeature.State(
        data: QuantOption(title: "", items: [], itemType: .checkbox),
        selectedList: []), reducer: {
        QuantCheckFeature()
        }))
}
