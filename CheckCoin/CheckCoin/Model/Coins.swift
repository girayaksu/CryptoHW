//
//  Coins.swift
//  CheckCoin
//
//  Created by Giray Aksu on 9.05.2024.
//

import Foundation

struct Crypto: Decodable {
    
    let status: String?
    let data: Data
    
}

struct Data: Decodable {
    let stats: Stats
    let coins: [Coins]
}

struct Stats: Decodable {
    let total: Int?
    let totalCoins: Int?
}



struct Coins: Decodable {
    
    let uuid: String?
    let symbol: String?
    let name: String?
    let iconUrl: String?
    let marketCap: String?
    let price: String?
    let change: String?
    let rank: Int?
    let volume: String?
    let btcPrice: String?
    
    enum CodingKeys: String, CodingKey {
        case uuid, symbol, name, iconUrl, 
             marketCap, price, change, rank, btcPrice
        case volume = "24hVolume"
    }
}
