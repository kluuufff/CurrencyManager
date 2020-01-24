//
//  StatisticTableViewController.swift
//  CurrencyManager
//
//  Created by Надежда Возна on 21.01.2020.
//  Copyright © 2020 Надежда Возна. All rights reserved.
//

import UIKit

class StatisticTableViewController: UITableViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var limitView: UIView! {
        didSet {
            limitView.layer.cornerRadius = 10
            limitView.layer.shadowOpacity = 0.2
            limitView.layer.shadowRadius = 9
            limitView.layer.shadowColor = UIColor.gray.cgColor
            limitView.layer.shadowOffset = CGSize.zero
        }
    }
    @IBOutlet weak var balanceView: UIView! {
        didSet {
            balanceView.layer.cornerRadius = 10
            balanceView.layer.shadowOpacity = 0.2
            balanceView.layer.shadowRadius = 9
            balanceView.layer.shadowColor = UIColor.gray.cgColor
            balanceView.layer.shadowOffset = CGSize.zero
        }
    }
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}
