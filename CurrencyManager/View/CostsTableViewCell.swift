//
//  CostsTableViewCell.swift
//  CurrencyManager
//
//  Created by Надежда Возна on 30.01.2020.
//  Copyright © 2020 Надежда Возна. All rights reserved.
//

import UIKit

class CostsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var costsTypeLabel: UILabel!
    @IBOutlet weak var backView: UIView! {
        didSet {
            backView.layer.cornerRadius = 12
            backView.layer.shadowOpacity = 0.15
            backView.layer.shadowRadius = 3.9
            backView.layer.shadowColor = UIColor.gray.cgColor
            backView.layer.shadowOffset = CGSize.zero
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
