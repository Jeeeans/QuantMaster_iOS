//
//  IndexManager.swift
//  QuantMaster
//
//  Created by 진성준 on 9/12/24.
//

import Foundation
import Combine

class IndexManager: ObservableObject {
    @Published var index = 0 {
        didSet {
            publisher.send(index)
        }
    }
    let publisher = PassthroughSubject<Int, Never>()
}
