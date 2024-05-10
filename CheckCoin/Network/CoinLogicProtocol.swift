//
//  CoinLogicProtocol.swift
//  CheckCoin
//
//  Created by Giray Aksu on 10.05.2024.
//

import Foundation


protocol CoinLogicProtocol {
    func getCoinList(completionHandler: @escaping (Result<Coins, Error>) -> Void)
}
