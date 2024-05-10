//
//  Router.swift
//  CheckCoin
//
//  Created by Giray Aksu on 10.05.2024.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
        
    case listedCoin
    
    var method: HTTPMethod {
        switch self {
        case .listedCoin:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .listedCoin:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        JSONEncoding.default
    }
    
    var url: URL {
        
        switch self {
        case .listedCoin:
            let url = URL(string: "https://psp-merchantpanel-service-sandbox.ozanodeme.com.tr/api/v1/dummy/coins")
            return url!
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
    
}
