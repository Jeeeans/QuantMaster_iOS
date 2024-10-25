//
//  QuantConditionsModel.swift
//  QuantMaster
//
//  Created by 진성준 on 9/22/24.
//

import Foundation

struct QuantConditionsModel: Decodable, Equatable {
    var selectList: [QuantSelectConditionModel]
    var checkList: [QuantCheckConditionModel]
}

struct QuantSelectConditionModel: Decodable, Equatable, Hashable {
    var id: UUID = UUID()
    var title: String
    var type: String
}

struct QuantCheckConditionModel: Decodable, Hashable, Equatable {
    var title: String
    var items: [QuantCheckConditionItemModel]
}

struct QuantCheckConditionItemModel: Decodable, Hashable, Equatable {
    var title: String
    var type: String
    var isSelected: Bool = true
}
