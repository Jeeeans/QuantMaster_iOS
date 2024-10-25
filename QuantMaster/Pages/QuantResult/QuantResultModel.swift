//
//  QuantResultModel.swift
//  QuantMaster
//
//  Created by 진성준 on 10/21/24.
//

import Foundation


struct QuantResultModel: Decodable, Equatable {
    let data: [QuantResult]
}

struct QuantResult: Decodable, Equatable {
    let year: String
    let month: String
    let day: String
    
    let earningsRate: String
    
    let investing: [QuantInvestingItem]
}

struct QuantInvestingItem: Decodable, Equatable {
    
    let name: String
    let market: String
    let startPrice: String
    let endPrice: String
    
    
}

struct QuantInvestingOptions: Decodable, Equatable {
    let name: String
    let startValue: String
    let endValue: String
    
}
