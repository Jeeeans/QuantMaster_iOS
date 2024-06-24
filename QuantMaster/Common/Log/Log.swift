//
//  Log.swift
//  QuantMaster
//
//  Created by 진성준 on 9/3/24.
//

import Foundation


public struct Log {
    
    public static var enable = true
    
    enum Level: String {
        case error = "[ERROR]"
        case warning = "[WARNING]"
        case info = "[INFO]"
        case debug = "[DEBUG]"
        case verbose = "[VERBOSE]"
    }
    
    public static func e(_ message: Any, file: String = #file, function: String = #function, lineNo: Int = #line) {
        
        Log.log(.error, message: message, file: file, function: function, lineNo: lineNo)
    }
    
    public static func w(_ message: Any, file: String = #file, function: String = #function, lineNo: Int = #line) {
        
        Log.log(.warning, message: message, file: file, function: function, lineNo: lineNo)
    }
    
    public static func i(_ message: Any, file: String = #file, function: String = #function, lineNo: Int = #line) {
        
        Log.log(.info, message: message, file: file, function: function, lineNo: lineNo)
    }
    
    public static func d(_ message: Any, file: String = #file, function: String = #function, lineNo: Int = #line) {
        
        Log.log(.debug, message: message, file: file, function: function, lineNo: lineNo)
    }
    
    public static func v(_ message: Any, file: String = #file, function: String = #function, lineNo: Int = #line) {
        
        Log.log(.verbose, message: message, file: file, function: function, lineNo: lineNo)
    }
    
    static func log(_ level: Level, message: Any, file: String = #file, function: String = #function, lineNo: Int = #line) {
        
        guard enable else { return }
        
        let components = file.components(separatedBy: "/")
        
        let fileName = components.isEmpty ? "" : components.last!
        
        let logMessage = message as? CustomDebugStringConvertible ?? message
        
        print("\(Date().logString) \(level.rawValue) => [\(fileName) \(function):\(lineNo)] \(logMessage)")
    }
}
