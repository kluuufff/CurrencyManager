//
//  CostsTableViewCell.swift
//  CurrencyManager
//
//  Created by Надежда Возна on 21.01.2020.
//  Copyright © 2020 Надежда Возна. All rights reserved.
//

import UIKit

class CostsTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var costsTypeLabel: UILabel!
    @IBOutlet weak var backView: UIView! {
        didSet {
            // Make it card-like
            backView.layer.cornerRadius = 10
            backView.layer.shadowOpacity = 0.25
            backView.layer.shadowRadius = 8
            backView.layer.shadowColor = UIColor.gray.cgColor
            backView.layer.shadowOffset = CGSize.zero
            backView.backgroundColor = .white
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
