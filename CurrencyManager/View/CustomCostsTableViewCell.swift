//
//  CustomCostsTableViewCell.swift
//  CurrencyManager
//
//  Created by Надежда Возна on 30.01.2020.
//  Copyright © 2020 Надежда Возна. All rights reserved.
//

import UIKit

class CustomCostsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var view1: UIView! {
        didSet {
            view1.layer.cornerRadius = 10
            view1.layer.shadowOpacity = 0.15
            view1.layer.shadowRadius = 7
            view1.layer.shadowColor = UIColor.gray.cgColor
            view1.layer.shadowOffset = CGSize.zero
        }
    }
    @IBOutlet weak var lastPaymentLabel: UILabel!
    @IBOutlet weak var typePaymentLabel: UILabel!
    @IBOutlet weak var availableLabel: UILabel!
    @IBOutlet weak var view2: UIView! {
        didSet {
            view2.layer.cornerRadius = 10
            view2.layer.shadowOpacity = 0.15
            view2.layer.shadowRadius = 7
            view2.layer.shadowColor = UIColor.gray.cgColor
            view2.layer.shadowOffset = CGSize.zero
        }
    }
    @IBOutlet weak var todayCostsLabel: UILabel!
    @IBOutlet weak var weeklyCostsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
