//
//  ReportType.swift
//  QuantMaster
//
//  Created by 진성준 on 9/3/24.
//

import Foundation


enum ReportType: String, Encodable {
    case QUARTER = "quarter" // "전분기"
    case HALF = "half" // "전반기"
    case YEAR = "year" // "전년도"
    
    var description: String {
        switch self {
        case .QUARTER: return "전분기"
        case .HALF: return "전반기"
        case .YEAR: return "전년도"
        }
    }
}
