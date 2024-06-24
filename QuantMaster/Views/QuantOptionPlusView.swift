//
//  QuantOptionPlusView.swift
//  QuantMaster
//
//  Created by 진성준 on 9/6/24.
//

import SwiftUI

struct QuantOptionPlusView: View {
    @Binding var addIndex: Bool
    
    var body: some View {
        Image(systemName: "plus.rectangle")
            .onTapGesture {
                self.addIndex = true
            }
    }
}

#Preview {
    QuantOptionPlusView(addIndex: Binding<Bool>(projectedValue: .constant(false)))
}
