//
//  CurrencyCell.swift
//  ticcker
//
//  Created by Emre Berk on 10/11/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import UIKit

class CurrencyCell:UITableViewCell{
    
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var priceLabel:UILabel!
    
    override func awakeFromNib() {
        selectionStyle = .none
        backgroundColor = .clear
        nameLabel.textColor = .white
    }
    
}
