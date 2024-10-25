//
//  Array+Extension.swift
//  QuantMaster
//
//  Created by 진성준 on 10/15/24.
//

import Foundation


extension Array {
    func removeFirst(where predicate: (Element) -> Bool) -> [Element] {
        guard let index = firstIndex(where: predicate) else { return self }
        var array = self
        array.remove(at: index)
        return array
    }
    
    func removeLast(where predicate: (Element) -> Bool) -> [Element] {
        guard let index = lastIndex(where: predicate) else { return self }
        return dropLast(index)
    }
}
