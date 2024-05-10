//
//  CoinLogic.swift
//  CheckCoin
//
//  Created by Giray Aksu on 10.05.2024.
//

import Foundation

final class CoinLogic: CoinLogicProtocol {
    
    static let shared: CoinLogic = {
        let instance = CoinLogic()
        return instance
    }()
    
    func getCoinList(completionHandler: @escaping (Result<Crypto, any Error>) -> Void) {
        Webservice.shared.request(request: Router.listedCoin,
            decodeToType: Crypto.self, completionHandler: completionHandler)
    }
    
    
}
