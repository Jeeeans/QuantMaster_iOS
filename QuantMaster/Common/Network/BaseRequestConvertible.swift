//
//  BaseRequestConvertible.swift
//  QuantMaster
//
//  Created by 진성준 on 9/3/24.
//

import Foundation
import Alamofire

// MARK: - Router
public enum BaseRouter<P> {
    case get(path: String?, parmeters: P?)
    case post(path: String?, parmeters: P?)
    case put(path: String?, parmeters: P?)
    case delete(path: String?, parmeters: P?)
    
    var method: HTTPMethod {
        switch self {
        case .get: return .get
        case .post: return .post
        case .put: return .put
        case .delete: return .delete
        }
    }
    
    var path: String? {
        switch self {
        case .get(let getPath, _): return getPath
        case .post(let postPath, _): return postPath
        case .put(let putPath, _): return putPath
        case .delete(let deletePath, _): return deletePath
        }
    }
    
    var parameters: P? {
        switch self {
        case .get(_, let getParams): return getParams
        case .post(_, let postParams): return postParams
        case .put(_, let putParams): return putParams
        case .delete(_, let deleteParams): return deleteParams
        }
    }
}

class BaseRequestConvertible: URLRequestConvertible {
    
    private var baseUrl = "https://www.mustit.co.kr"
    private var headers: HTTPHeaders?
    private var urlRequest: URLRequest?
    
    
    public func baseUrl(_ block: () -> String) {
        baseUrl = block()
    }
    
    public func headers(_ block: () -> HTTPHeaders) {
        headers = block()
    }
    
    static func buildWith(_ block: (BaseRequestConvertible) -> Void) -> BaseRequestConvertible {
        return BaseRequestConvertible().apply(block: block)
    }
    
    func apply(block: (BaseRequestConvertible) -> Void) -> BaseRequestConvertible {
        block(self)
        return self
    }
    
    private func baseURLRequest(path: String?, method: HTTPMethod?) throws -> URLRequest {
        let urlString = "\(baseUrl)/\(path ?? "")"
        let url = try urlString.asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method ?? .get
        urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        return urlRequest
    }
    
    private func headerWith(_ urlRequest: URLRequest) -> URLRequest {
        var mutableRequest = urlRequest
        if let headers = headers {
            for case let header in headers where header.value.isEmpty == false {
                mutableRequest.addValue(header.value, forHTTPHeaderField: header.name)
            }
        }
        return mutableRequest
    }
    
    public func urlRequest(_ block: () -> BaseRouter<Parameters>) {
        do {
            let router = block()
            var urlRequest = try baseURLRequest(path: router.path, method: router.method)
            if urlRequest.method == .get {
                urlRequest = try URLEncoding.default.encode(urlRequest, with: router.parameters)
            } else {
                urlRequest = try JSONEncoding.default.encode(urlRequest, with: router.parameters)
            }
            self.urlRequest = urlRequest
        } catch {
            Log.d(error.localizedDescription)
        }
    }
    
    public func urlRequest<P: Encodable>(_ block: () -> BaseRouter<P>) {
        do {
            let router = block()
            var urlRequest = try baseURLRequest(path: router.path, method: router.method)
            if urlRequest.method == .get {
                urlRequest = try URLEncodedFormParameterEncoder.default.encode(router.parameters, into: urlRequest)
            } else {
                urlRequest = try JSONParameterEncoder.default.encode(router.parameters, into: urlRequest)
            }
            self.urlRequest = urlRequest
        } catch {
            Log.d(error.localizedDescription)
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        if let urlRequest = urlRequest {
            return headerWith(urlRequest)
        } else {
            throw URLError(URLError.badURL)
        }
    }
}
