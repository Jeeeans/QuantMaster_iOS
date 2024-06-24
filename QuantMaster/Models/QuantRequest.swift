//
//  QuantRequest.swift
//  QuantMaster
//
//  Created by 진성준 on 9/3/24.
//

import Foundation

struct BackTestRequest: Encodable {
    var filter: BackTestFilter?
    var index: [BackTestIndexCondition]
    var reBalancing: ReBalancing
    var reportType: ReportType
}

struct BackTestFilter: Encodable {
    var marketFilter: MarketType
    var excludedSector: [SectorType]?
    var customOptions: [CustomOption]?
}

struct CustomOption: Encodable {
    var type: IndexType
    var value: Double
    var valueType: ValueType
    var compareType: CompareType
}

struct BackTestIndexCondition: Encodable {
    var type: IndexType
    var minimumvalue: Double?
    var maximumvalue: Double?
    var order: String?
}

struct ReBalancing: Encodable {
    var startYear: String
    var endYear: String
    var periods: [BackTestPeriod]
}

struct BackTestPeriod: Encodable {
    var startMonth: String /* MM */
    var endMonth: String /* MM */
}
