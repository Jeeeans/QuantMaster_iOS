//
//  Date+Extension.swift
//  QuantMaster
//
//  Created by 진성준 on 9/3/24.
//

import Foundation


extension Date {
    
    var logString: String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ssSSS"
        
        dateFormatter.locale = Locale.current
        
        dateFormatter.timeZone = TimeZone.current
        
        let dateString = dateFormatter.string(from: self)
        
        return dateString
    }
}
