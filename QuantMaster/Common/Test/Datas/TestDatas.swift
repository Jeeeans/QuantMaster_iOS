//
//  TestDatas.swift
//  QuantMaster
//
//  Created by 진성준 on 10/22/24.
//

#if DEBUG

struct TestData {
    static var checkConditionModel = [
        QuantCheckConditionModel(title: "마켓",
                                 items: [
                                    QuantCheckConditionItemModel(title: "KOSDAQ", type: ""),
                                    QuantCheckConditionItemModel(title: "KOSPI", type: ""),
                                    QuantCheckConditionItemModel(title: "KONEX", type: ""),
                                    QuantCheckConditionItemModel(title: "KONEX2", type: "")]),
        QuantCheckConditionModel(title: "업종",
                                 items: [
                                    QuantCheckConditionItemModel(title: "금융", type: ""),
                                    QuantCheckConditionItemModel(title: "IT", type: ""),
                                    QuantCheckConditionItemModel(title: "전자", type: ""),
                                    QuantCheckConditionItemModel(title: "해운", type: "")]),
        
        
    ]
    
    static var selectConditionModel = [QuantSelectConditionModel(title: "PER", type: "PER"),
                                QuantSelectConditionModel(title: "PBR", type: "PBR"),
                                QuantSelectConditionModel(title: "ROE", type: "ROE"),
                                QuantSelectConditionModel(title: "EV", type: "EV"),
                                QuantSelectConditionModel(title: "EBIT", type: "EBIT"),
                                QuantSelectConditionModel(title: "EV/EBIT", type: "EV/EBIT"),
                                QuantSelectConditionModel(title: "EBITA", type: "EBITA"),
                                QuantSelectConditionModel(title: "EV/EBITA", type: "EV/EBITA")]
}

#endif
