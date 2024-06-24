//
//  BaseAuthenticator.swift
//  QuantMaster
//
//  Created by 진성준 on 9/3/24.
//

import Foundation
import Alamofire

class BaseAuthenticationCredential: AuthenticationCredential {
    var requiresRefresh: Bool = true
}

class BaseAuthenticator: Authenticator {
    
    typealias Credential = BaseAuthenticationCredential
    
    func apply(_ credential: Credential, to urlRequest: inout URLRequest) {
        urlRequest.headers = HTTPHeaders()
    }
    
    func refresh(_ credential: Credential, for session: Session, completion: @escaping (Result<Credential, any Error>) -> Void) {
        
    }
    
    func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: any Error) -> Bool {
        return false
    }
    
    
    func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: Credential) -> Bool {
        return true
    }
}
