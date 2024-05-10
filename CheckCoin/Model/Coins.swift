//
//  Coins.swift
//  CheckCoin
//
//  Created by Giray Aksu on 9.05.2024.
//

import Foundation

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
    
    enum CodingKeys: String, CodingKey {
        case uuid, symbol, name, iconUrl, 
             marketCap, price, change, rank
        case volume = "24hVolume"
    }
}
