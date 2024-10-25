//
//  Main.swift
//  QuantMaster
//
//  Created by 진성준 on 9/3/24.
//

import SwiftUI
import ComposableArchitecture

struct Main: View {
    
    @Bindable var store: StoreOf<MainFeature>
    
    var body: some View {
        
        NavigationSplitView {
            ZStack {
                if let conditions = self.store.conditions {
                    QuantConditionListView(store:
                            .init(initialState: QuantConditionListFeature.State(data: conditions),
                                  reducer: { QuantConditionListFeature() })
                    )
                    .alert($store.scope(state: \.alert, action: \.alert))

                }
            }
        } detail: {
            QuantResultView(store: .init(initialState: QuantResultFeatures.State(results: self.store.state.results),
                                         reducer: { QuantResultFeatures() }
                                        )
            )
        }
        .onAppear {
            self.store.send(.fetchQuantConditions)
            self.store.send(.onAppear)
        }
    }
}

#Preview {
    Main(store: .init(initialState: MainFeature.State(),
                      reducer: { MainFeature(service: MainServiceTest()) })
    )
}
