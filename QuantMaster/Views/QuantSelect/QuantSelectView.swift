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
    var 
    @ObservedObject var indexManager = IndexManager()
    
    @Binding var lowerValue: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Picker(store.data.title, selection: $indexManager.index) {
                    ForEach(store.data.items) { option in
                        Text(option.title)
                    }
                }
                .listRowSeparator(.visible)
                .pickerStyle(.menu)
                .onReceive(indexManager.publisher, perform: { index in
                    let item = self.store.data.items[index]
                    store.send(.selectOption(item))
                })
                
                Button("", systemImage: "xmark.circle") {
                    store.send(.deleteButtonTapped)
                }
            }
            HStack {
                TextField("하윗값", text: store.binding(
                    get: \.lowerValue,
                    send: QuantSelectFeature.Action.setLowerValue))
                    .textFieldStyle(.roundedBorder)
                    .padding(8)
                    .onReceive(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Publisher@*/NotificationCenter.default.publisher(for: .NSCalendarDayChanged)/*@END_MENU_TOKEN@*/, perform: { _ in
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=code@*/ /*@END_MENU_TOKEN@*/
                    })
                Picker("", selection: $store.lowerOption) {
                    ForEach(CompareType.allCases) { type in
                        Text(type.description)
                    }
                }
            }
            HStack {
                TextField("상윗값", text: $store.higherValue)
                    .textFieldStyle(.roundedBorder)
                    .padding(8)
                Picker("", selection: $store.higherOption) {
                    ForEach(CompareType.allCases) { type in
                        Text(type.description)
                    }
                }
            }
            Picker("", selection: $store.orderOption) {
                ForEach(OrderType.allCases) { type in
                    Text(type.description)
                }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}

#Preview {
    QuantSelectView(store: Store(initialState: QuantSelectFeature.State(
        data: QuantOption(title: "", items: [
            QuantOptionItem(title: "PER"),
            QuantOptionItem(title: "PBR"),
            QuantOptionItem(title: "ROE"),
            QuantOptionItem(title: "EV"),
            QuantOptionItem(title: "EBIT"),
            QuantOptionItem(title: "EV/EBIT"),
            QuantOptionItem(title: "EBITA"),
            QuantOptionItem(title: "EV/EBITA")], itemType: .selectbox)),reducer: {
        QuantSelectFeature()
            }
    ))
}
