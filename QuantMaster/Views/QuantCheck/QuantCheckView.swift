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
    
    @State private var tags: [Int] = []
    var rows: [GridItem] = [.init(.fixed(50)), .init(.fixed(50))]
    
    var body: some View {
//        Text(self.store)
//            .font(.subheadline)
        
//        Picker("", selection: self.$indexManager.index) {
//            ForEach(self.store.data.items) { option in
//                Text(option.title)
//                    .font(.title)
//                    .tag(self.store.data.items.firstIndex(of: option))
//            }
//        }
//        .pickerStyle(.segmented)
//        .onReceive(self.indexManager.publisher) { index in
//            let item = store.data.items[index]
//            self.store.send(.addOption(item))
//        }
        Text("\(store.data.title)")
        Checkbox(tags: $tags) {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(0..<store.data.items.count, id: \.self) { tag in
                        itemView(tag, item: store.data.items[tag])
                    }
                }
            }
        } onTapReceive: { value in
            let item = self.store.data.items[value]
            self.store.send(.addOption(item))
        }
    }
    
    private func itemView(_ tag: Int, item: QuantCheckConditionItemModel) -> some View {
        HStack(spacing: 5) {
            Text("\(item.title)")
                .font(.system(size: 13))
            CheckItem(tag: tag, size: 13)
        }
        .padding(6)
        .checkTag(tag)
    }
}

#Preview {
    QuantCheckView(store: .init(initialState: QuantCheckFeature.State(data: TestData.checkConditionModel.first!),
                                reducer: { QuantCheckFeature() })
    )
}
