//
//  OrderType.swift
//  QuantMaster
//
//  Created by 진성준 on 9/3/24.
//

import Foundation

enum OrderType: String, CaseIterable, Identifiable {
    case ASC = "ASC"
    case DES = "DES"
    
    var id: String { return self.rawValue }
    var description: String {
        switch self {
        case .ASC: return "ascending".localized
        case .DES: return "descending".localized
        }
    }
}
