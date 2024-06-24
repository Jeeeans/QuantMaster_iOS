//
//  QuantIndexModel.swift
//  QuantMaster
//
//  Created by 진성준 on 9/4/24.
//

import Foundation

struct QuantIndexModel: Hashable, Decodable {
    
}

struct QuantOption: Hashable, Decodable {
    var title: String
    var items: [QuantOptionItem]
    var itemType: OptionItemType
}

struct QuantOptionItem: Hashable, Decodable, Identifiable {
    var id: UUID = UUID()
    var title: String
    var isSelected: Bool = false
}

enum OptionItemType: Decodable {
    case checkbox
    case selectbox
}
