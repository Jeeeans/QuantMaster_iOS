//
//  QuantConditionListView.swift
//  QuantMaster
//
//  Created by 진성준 on 9/6/24.
//

import SwiftUI

struct QuantConditionListView: View {
    var body: some View {
        LazyVStack(content: {
            ForEach(1...10, id: \.self) { count in
                /*@START_MENU_TOKEN@*/Text("Placeholder \(count)")/*@END_MENU_TOKEN@*/
            }
        })
    }
}

#Preview {
    QuantConditionListView()
}
