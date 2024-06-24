//
//  Main.swift
//  QuantMaster
//
//  Created by 진성준 on 9/3/24.
//

import SwiftUI

struct Main: View {
    var body: some View {
        NavigationSplitView {
            QuantConditionListView()
        } detail: {
            QuantResultView()
        }
    }
}

#Preview {
    Main()
}
