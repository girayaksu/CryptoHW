//
//  CoinCell.swift
//  CheckCoin
//
//  Created by Giray Aksu on 10.05.2024.
//

import UIKit

class CoinCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var shortName: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var change: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func configure(withModel model: Coins) {
        shortName.text = model.symbol
        name.text = model.name
        let newSuffix = "png"
        let url = URL(string: (model.iconUrl?.dropLast(3) ?? "") + newSuffix)
        icon.kf.setImage(
            with: url,
            options: [
                .transition(.fade(1)),
                .cacheOriginalImage
            ]) 
        if let prices = Double(model.price ?? "") {
            self.price.text = String(format: "%.4f", prices)
        }
        change.text = model.change
        if model.change?.first == "-" {
            change.textColor = .systemRed
        } else {
            change.textColor = .systemGreen
        }
    }
    
}
