//
//  DetailViewController.swift
//  CheckCoin
//
//  Created by Giray Aksu on 10.05.2024.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var symbolDetail: UILabel!
    @IBOutlet weak var nameDetail: UILabel!
    @IBOutlet weak var priceDetail: UILabel!
    @IBOutlet weak var btcPriceDetail: UILabel!
    @IBOutlet weak var marketCapDetail: UILabel!
    
    var symbolD = ""
    var nameD = ""
    var priceD = ""
    var btcPriceD = ""
    var marketCapD = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        symbolDetail.text = symbolD
        nameDetail.text = nameD
        priceDetail.text = priceD
        btcPriceDetail.text = btcPriceD
        marketCapDetail.text = marketCapD
        
    }
    
}
