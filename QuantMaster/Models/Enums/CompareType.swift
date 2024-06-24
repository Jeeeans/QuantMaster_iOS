//
//  CompareType.swift
//  QuantMaster
//
//  Created by 진성준 on 9/3/24.
//

import Foundation

enum CompareType: String, Encodable, CaseIterable, Identifiable {
    case MORE = "more"
    case OVER = "over"
    case LESS = "less"
    case BELOW = "below"
    case HIGHEST = "highest"
    case LOWEST = "lowest"
    
    var id: String { return self.rawValue }
    var description: String {
        switch self {
        case .MORE: return "more".localized
        case .OVER: return "over".localized
        case .LESS: return "less".localized
        case .BELOW: return "below".localized
        case .HIGHEST: return "highest".localized
        case .LOWEST: return "lowest".localized
        }
    }
}
