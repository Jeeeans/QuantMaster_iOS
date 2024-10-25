//
//  QuantOptionPlusView.swift
//  QuantMaster
//
//  Created by 진성준 on 9/6/24.
//

import SwiftUI
import ComposableArchitecture

struct QuantOptionPlusView: View {
    @Bindable var store: StoreOf<QuantOptionPlusFeature>
    
    var body: some View {
        Image(systemName: "plus.rectangle")
            .onTapGesture {
                self.store.send(.plusButtonTapped)
            }
    }
}

#Preview {
    QuantOptionPlusView(
        store: .init(initialState: QuantOptionPlusFeature.State(),
                     reducer: { QuantOptionPlusFeature() }
                    )
    )
}
