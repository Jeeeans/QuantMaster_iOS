//
//  CommonClient.swift
//  QuantMaster
//
//  Created by 진성준 on 9/22/24.
//

import Alamofire

class CommonClient: BaseApiClient {
    static var shared = CommonClient()
    
    override func headers() -> HTTPHeaders {
        HTTPHeaders()
    }
    
    override var urlString: String { return Constants.Url.api }
}
