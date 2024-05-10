//
//  Webservice.swift
//  CheckCoin
//
//  Created by Giray Aksu on 10.05.2024.
//

import Foundation
import Alamofire

final class Webservice {
    
    static let shared: Webservice = {
        let instance = Webservice()
        return instance
    }()
    
    private init() {}
    
    func request<T: Decodable>(request: URLRequestConvertible, decodeToType type: T.Type,
        completionHandler: @escaping (Result<T, Error>) -> Void) {
        
        AF.request(request).responseData {  response in
        //    guard let self else { return }
          //  [weak self]
            switch response.result {
                
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from:  data)
                    completionHandler(.success(decodedData))
                } catch {
                    print("JSON DECODE ERROR")
                }
                
            case .failure(let error):
                completionHandler(.failure(error.localizedDescription as! Error))
            }
            
        }
    }
}
