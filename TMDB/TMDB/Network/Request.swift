//
//  Request.swift
//  TMDB
//
//  Created by Jose Ponciano López Romero on 1/14/21.
//  Copyright © 2021 JoseLR. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
    case head = "HEAD"
    case options = "OPTIONS"
    case trace = "TRACE"
    case connect = "CONNECT"
}

public struct RequestData {
    public let path: String
    public let method: HTTPMethod
    public let params: [String: Any?]?
    public let headers: [String: String]?
    
    public init (
        path: String,
        method: HTTPMethod = .get,
        params: [String: Any?]? = nil,
        headers: [String: String]? = nil
        ) {
        self.path = path
        self.method = method
        self.params = params
        self.headers = headers
    }
}

public extension URLRequest {
    
    public var method: HTTPMethod? {
        
        get {
            
            guard let httpMethod = self.httpMethod else { return nil }
            let method = HTTPMethod(rawValue: httpMethod)
            return method
        }
        
        set {
            
            self.httpMethod = newValue?.rawValue
        }
    }
}


public extension RequestType {
    
    public func fetch (
        dispatcher: NetworkDispatcher? = nil,
        onSuccess: @escaping (ResponseType) -> Void,
        onError: @escaping (Error) -> Void
        ) {
        
        let safeDispatcher: NetworkDispatcher = dispatcher ?? (Environment.isEnvMocked ? MockNetworkDispatcher.instance : URLSessionNetworkDispatcher.instance)
        
        safeDispatcher.dispatch(
            request: self.data,
            onSuccess: { (responseData: Data) in
                do {
                    let jsonDecoder = JSONDecoder()
                    let result = try jsonDecoder.decode(ResponseType.self, from: responseData)
                    DispatchQueue.main.async {
                        onSuccess(result)
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        onError(error)
                    }
                }
        },
            onError: { (error: Error) in
                DispatchQueue.main.async {
                    onError(error)
                }
        }
        )
    }
}

public extension Error {
    func printDescription() {
        print(self)
    }
}
