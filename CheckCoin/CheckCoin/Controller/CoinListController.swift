//
//  CoinListController.swift
//  CheckCoin
//
//  Created by Giray Aksu on 9.05.2024.
//

import UIKit
import Kingfisher

class CoinListController: UIViewController {
    
    var cryptoCoins = [Coins]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "CoinCell", bundle: nil), forCellReuseIdentifier: "coinCell")
        
        CoinLogic.shared.getCoinList { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let cryptoList):
                self.cryptoCoins = cryptoList.data.coins
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}

extension CoinListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptoCoins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath) as! CoinCell
        
        cell.configure(withModel: cryptoCoins[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCoin = cryptoCoins[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: selectedCoin)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let detailVC = segue.destination as! DetailViewController
            let coinToSend = sender as! Coins
            detailVC.nameD = coinToSend.name ?? ""
            detailVC.symbolD = coinToSend.symbol ?? ""
            detailVC.priceD = coinToSend.price ?? ""
            detailVC.marketCapD = coinToSend.marketCap ?? ""
            detailVC.btcPriceD = coinToSend.btcPrice ?? ""
        }
    }
}
