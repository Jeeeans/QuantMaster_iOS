//
//  QuantResultView.swift
//  QuantMaster
//
//  Created by 진성준 on 9/6/24.
//

import SwiftUI
import ComposableArchitecture

struct QuantResultView: View {
    
    var store: StoreOf<QuantResultFeatures>
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    QuantResultView(store: .init(initialState: QuantResultFeatures.State(),
                                 reducer: { QuantResultFeatures() }))
}
