//
//  CostsTableViewCell.swift
//  CurrencyManager
//
//  Created by Надежда Возна on 21.01.2020.
//  Copyright © 2020 Надежда Возна. All rights reserved.
//

import UIKit

class CostsTableViewCell2: UITableViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var costsTypeLabel: UILabel!
    @IBOutlet weak var backView: UIView! {
        didSet {
            //Added style for cells
            backView.layer.cornerRadius = 10
            backView.layer.shadowOpacity = 0.15
            backView.layer.shadowRadius = 8
            backView.layer.shadowColor = UIColor.gray.cgColor
            backView.layer.shadowOffset = CGSize.zero
//            backView.backgroundColor = .
        }
    }
}
