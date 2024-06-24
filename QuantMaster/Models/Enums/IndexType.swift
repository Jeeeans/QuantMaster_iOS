//
//  IndexType.swift
//  QuantMaster
//
//  Created by 진성준 on 9/3/24.
//

import Foundation

enum IndexType: String, Encodable {
    case PER = "PER"
    case PBR = "PBR"
    case ROE = "ROE"
    case DEBT_RATE = "debtRate"
    case EV = "EV"
    case EBIT = "EBIT"
    case EBITDA = "EBITDA"
    case EV_EBIT = "EV_EBIT"
    case EV_EBITDA = "EV_EBITDA"
    case MARKET_CAPITALIZATION = "marketCapitalization"
}
