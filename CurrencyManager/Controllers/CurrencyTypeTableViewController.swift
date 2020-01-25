//
//  CurrencyTypeTableViewController.swift
//  CurrencyManager
//
//  Created by Надежда Возна on 25.01.2020.
//  Copyright © 2020 Надежда Возна. All rights reserved.
//

import UIKit

class CurrencyTypeTableViewController: UITableViewController {
    
    private var currencyArray = [String: String]()
    private var currentCurrency = ""
//    private var cell: CurrencyTypeTableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyArray = ["$": "USD", "€": "EURO", "₽": "RUB"]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
//                if self.isMovingToParent {
//                    if cell.accessoryType == .checkmark {
//                        currentCurrency = cell.currSymbolLabel.text!
//                        print("currentCurrency: \(currentCurrency)")
//                    }
//                    UserDefaults.standard.set(amountTextField.text, forKey: "amountSettings")
//                }
    }
}

extension CurrencyTypeTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currCell", for: indexPath) as! CurrencyTypeTableViewCell
        let currSymbol = Array(self.currencyArray.keys)[indexPath.row]
        let currName = Array(self.currencyArray.values)[indexPath.row]
        #if DEBUG
        print("key = \(currSymbol)")
        print("value = \(currName)")
        #endif
        cell.currSymbolLabel.text = currSymbol
        cell.currNameLabel.text = currName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        for cellPath in tableView.indexPathsForVisibleRows! {
            if cellPath == indexPath {
                continue
            }
            tableView.cellForRow(at: cellPath)!.accessoryType = .none
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
