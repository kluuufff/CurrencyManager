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
    private var symbolsArray = [String]()
    private var currentCurrency = ""
    private var cell: CurrencyTypeTableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyArray = ["$": "USD", "€": "EURO", "₽": "RUB"]
        symbolsArray = ["$", "€", "₽"]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("currentCurrency: \(currentCurrency)")
        currentCurrency = symbolsArray[UserDefaults.standard.integer(forKey: "index")]
        if self.isMovingToParent {
            UserDefaults.standard.set(currentCurrency, forKey: "currencySymbolSettings")
            print("currentCurrency: \(currentCurrency)")
        }
    }
}

extension CurrencyTypeTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return symbolsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currCell", for: indexPath) as! CurrencyTypeTableViewCell
        let currSymbol = Array(self.currencyArray.keys)[indexPath.row]
        let currName = Array(self.currencyArray.values)[indexPath.row]
        #if DEBUG
        print("key = \(currSymbol)")
        print("value = \(currName)")
        #endif
        cell.currSymbolLabel.text = symbolsArray[indexPath.row]
        cell.currNameLabel.text = "currName"
        print("myIndexPath \(String(describing: myIndexPath))")
        let i = IndexPath(row: UserDefaults.standard.integer(forKey: "index"), section: 0)
        print("flag = \(flag)")
        if flag {
            if indexPath == myIndexPath {
                print("i = \(i)")
                cell.accessoryType = .checkmark
            }
        } else {
            if indexPath == i {
                print("i = \(i)")
                cell.accessoryType = .checkmark
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        for cellPath in tableView.indexPathsForVisibleRows! {
            if cellPath == indexPath {
                if let cell = tableView.cellForRow(at: indexPath) {
                    if cell.accessoryType == .checkmark {
                        UserDefaults.standard.set(indexPath.row, forKey: "index")
                        flag = true
                        myIndexPath = indexPath
                        print("myIndexPath from didSelectRowAt \(String(describing: myIndexPath))")
                    }
                }
                continue
            }
            tableView.cellForRow(at: cellPath)!.accessoryType = .none
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
