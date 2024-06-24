//
//  BaseNetwork.swift
//  QuantMaster
//
//  Created by 진성준 on 9/3/24.
//

import Alamofire
import Combine
import Dispatch

open class BaseApiClient {
    
    public static let queue = DispatchQueue(label: Constants.Identifier.networkQueue,
                                            qos: .background,
                                            attributes: .concurrent)
    
    var urlString: String!
    
    open func actionBeforeRequest(_ completion: @escaping (BaseApiClientError?) -> Void) { completion(nil) }
    
    open func headers() -> HTTPHeaders { return HTTPHeaders() }
    
    open func baseApiClientErrorHandler(_ error: BaseApiClientError) { return }
    
    public func buildConvertible(urlString: String, router: BaseRouter<Parameters>) -> URLRequestConvertible {
        return BaseRequestConvertible.buildWith { convertible in
            convertible.baseUrl { urlString }
            convertible.headers { headers() }
            convertible.urlRequest { router }
        }
    }
    
    public func builcConvertible<P: Encodable>(urlString: String, router: BaseRouter<P>) -> URLRequestConvertible {
        return BaseRequestConvertible.buildWith { convertible in
            convertible.baseUrl { urlString }
            convertible.headers { headers() }
            convertible.urlRequest { router }
        }
    }
    
    public func buildConvertible(_ router: BaseRouter<Parameters>) -> URLRequestConvertible {
        return BaseRequestConvertible.buildWith { convertible in
            convertible.baseUrl { urlString }
            convertible.headers { headers() }
            convertible.urlRequest { router }
        }
    }
    
    public func buildConvertible<P: Encodable>(_ router: BaseRouter<P>) -> URLRequestConvertible {
        return BaseRequestConvertible.buildWith { convertible in
            convertible.baseUrl { urlString }
            convertible.headers { headers() }
            convertible.urlRequest { router }
        }
    }
    
    func sendGet<T: Decodable>(with url: String, parameters: Parameters) -> AnyPublisher<T, Error> {
        let convertible = self.buildConvertible(urlString: url, router: BaseRouter.get(path: nil, parmeters: parameters))
        return self.sendRequest(convertible: convertible)
    }
    
    func sendGet<T: Decodable>(path: String, parameters: Parameters) -> AnyPublisher<T, Error> {
        let convertible = self.buildConvertible(BaseRouter.get(path: path, parmeters: parameters))
        return self.sendRequest(convertible: convertible)
    }
    
    func sendGet<T: Decodable, P: Encodable>(path: String, parameters: P) -> AnyPublisher<T, Error> {
        let convertible = self.buildConvertible(BaseRouter.get(path: path, parmeters: parameters))
        return self.sendRequest(convertible: convertible)
    }
    
    
    func sendRequest<T: Decodable>(convertible: URLRequestConvertible) -> AnyPublisher<T, Error> {
        
        return Future<T, Error> { [weak self] promise in
            guard let self = self else { return }
            self.actionBeforeRequest { [weak self] error in
                guard let self else { return }
                if let error {
                    promise(.failure(error))
                } else {
                    let authInterceptor = AuthenticationInterceptor<BaseAuthenticator>(authenticator: BaseAuthenticator())
                    AF.request(convertible, interceptor: authInterceptor).validate()
                        .responseDecodable(queue: Self.queue) { [weak self] (response: AFDataResponse<T>) in
                            guard let self = self else { return }
                            self.onCompleted(promise: promise, response: response)
                        }
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func onCompleted<T: Decodable>(promise: @escaping Future<T, Error>.Promise, response: AFDataResponse<T>) {
        
        switch response.result {
        case .success(let data):
            
            promise(.success(data))
        case .failure(let error):
            var apiError: BaseApiClientError!
            if response.response?.statusCode == 401 {
                apiError = BaseApiClientError.unAuthorized(request: response.request, response: response.response, data: response.data, error: error)
            } else {
                apiError = BaseApiClientError.error(request: response.request, response: response.response, data: response.data, error: error)
            }
            
            promise(.failure(error))
            
            self.handleError(error: apiError)
        }
    }
    
    private func handleError(error: BaseApiClientError) {
        switch error {
        case .unAuthorized:
            Log.d("Unauthorized: access token expired.")
        case .error(_, _, _, let error):
            Log.d(error?.localizedDescription ?? "BaseAPIClientError")
        }
        self.baseApiClientErrorHandler(error)
    }
}

