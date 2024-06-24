//
//  BaseNetwork+Error.swift
//  QuantMaster
//
//  Created by 진성준 on 9/3/24.
//

import Foundation


// MARK: - Error type
public enum BaseApiClientError: Error {
    case error(request: URLRequest?, response: HTTPURLResponse?, data: Data?, error: Error?)
    case unAuthorized(request: URLRequest?, response: HTTPURLResponse?, data: Data?, error: Error?)
}



// MARK: - Error Model
public struct ErrorModel: Codable {
    public let status: Int
    public let name, reason, action, message, stack: String
    
    public enum CodingKeys: String, CodingKey {
        case status, name, reason, action, message, stack
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status) ?? -1
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        reason = try values.decodeIfPresent(String.self, forKey: .reason) ?? ""
        action = try values.decodeIfPresent(String.self, forKey: .action) ?? ""
        message = try values.decodeIfPresent(String.self, forKey: .message) ?? ""
        stack = try values.decodeIfPresent(String.self, forKey: .stack) ?? ""
    }
}
