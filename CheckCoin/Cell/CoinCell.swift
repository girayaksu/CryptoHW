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

        // Configure the view for the selected state
    }
    
    public func configure(withModel model: Coins) {
        icon.image = UIImage(systemName: "star.fill")
        shortName.text = model.symbol
        name.text = model.name
        price.text = model.price
        change.text = model.change
    }
    
}
