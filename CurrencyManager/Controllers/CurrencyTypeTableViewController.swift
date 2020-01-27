//
//  CurrencyTypeTableViewController.swift
//  CurrencyManager
//
//  Created by Надежда Возна on 25.01.2020.
//  Copyright © 2020 Надежда Возна. All rights reserved.
//

import UIKit

class CurrencyTypeTableViewController: UITableViewController {
    
    private var currencyArray: [(symbol: String, name: String)] = [
        ("$", "USD"), ("€", "EURO"), ("₽", "RUB"), ("Lek", "ALL"), ("؋", "AFN"),
        ("$", "ARS"), ("ƒ", "AWG"), ("$", "AUD"), ("₼", "AZN"), ("$", "BSD"),
        ("$", "BBD"), ("Br", "BYN"), ("BZ$", "BZD"), ("$", "BMD"), ("$b", "BOB"),
        ("KM", "BAM"), ("", "BWP"), ("лв", "BGN"), ("R$", "BRL"), ("$", "BND"),
        ("៛", "KHR"), ("$", "CAD"), ("$", "KYD"), ("$", "CLP"), ("¥", "CNY"),
        ("$", "COP"), ("₡", "CRC"), ("kn", "HRK"), ("₱", "CUP"), ("Kč", "CZK"),
        ("kr", "DKK"), ("RD$", "DOP"), ("$", "XCD"), ("£", "EGP"), ("$", "SVC"),
        ("£", "FKP"), ("$", "FJD"), ("¢", "GHS"), ("£", "GIP"), ("Q", "GTQ"), ("£", "GGP"),
        ("$", "GYD"), ("L", "HNL"), ("$", "HKD"), ("Ft", "HUF"), ("kr", "ISK"), ("₹", "INR"),
        ("Rp", "IDR"), ("﷼", "IRR"), ("£", "IMP"), ("₪", "ILS"), ("J$", "JMD"), ("¥", "JPY"),
        ("£", "JEP"), ("лв", "KZT"), ("₩", "KPW"), ("₩", "KRW"), ("лв", "KGS"), ("₭", "LAK"),
        ("£", "LBP"), ("$", "LRD"), ("ден", "MKD"), ("RM", "MYR"), ("₨", "MUR"), ("$", "MXN"),
        ("₮", "MNT"), ("MT", "MZN"), ("$", "NAD"), ("₨", "NPR"), ("ƒ", "ANG"), ("$", "NZD"),
        ("C$", "NIO"), ("₦", "NGN"), ("kr", "NOK"), ("﷼", "OMR"), ("₨", "PKR"), ("B/.", "PAB"),
        ("Gs", "PYG"), ("S/.", "PEN"), ("₱", "PHP"), ("zł", "PLN"), ("﷼", "QAR"), ("lei", "RON"),
        ("£", "SHP"), ("﷼", "SAR"), ("Дин.", "RSD"), ("₨", "SCR"), ("$", "SGD"), ("$", "SBD"),
        ("S", "SOS"), ("R", "ZAR"), ("₨", "LKR"), ("kr", "SEK"), ("CHF", "CHF"), ("$", "SRD"),
        ("£", "SYP"), ("NT$", "TWD"), ("฿", "THB"), ("TT$", "TTD"), ("₺", "TRY"), ("$", "TVD"),
        ("₴", "UAH"), ("£", "GBP"), ("$U", "UYU"), ("лв", "UZS"), ("Bs", "VEF"),
        ("₫", "VND"), ("﷼", "YER"), ("Z$", "ZWD")]
    private var currencyDictionary = [String: [String]]()
    private var currencySectionTitles = [String]()
    private var currentCurrency = ""
    private let index = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for (_, value) in currencyArray {
            let currKey = String(value.prefix(1))
            if var currValues = currencyDictionary[currKey] {
                currValues.append(value)
                currencyDictionary[currKey] = currValues
            } else {
                currencyDictionary[currKey] = [value]
            }
        }
        currencySectionTitles = [String](currencyDictionary.keys)
        currencySectionTitles = currencySectionTitles.sorted(by: { $0 < $1 })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("currentCurrency: \(currentCurrency)")
        currentCurrency = currencyArray[index.integer(forKey: "index")].symbol
        if self.isMovingToParent {
            index.set(currentCurrency, forKey: "currSymbol")
            print("currentCurrency: \(currentCurrency)")
        }
    }
}

extension CurrencyTypeTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return currencySectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currKey = currencySectionTitles[section]
        if let currValues = currencyDictionary[currKey] {
            return currValues.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return currencySectionTitles[section]
    }
    
     override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return currencySectionTitles
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currCell", for: indexPath) as! CurrencyTypeTableViewCell
        
        let currKey = currencySectionTitles[indexPath.section]
        if let currValues = currencyDictionary[currKey] {
            cell.currSymbolLabel.text = currencyArray[indexPath.row].symbol
            cell.currNameLabel.text = currValues[indexPath.row]
        }
        
        let i = IndexPath(row: index.integer(forKey: "index"), section: 0)
        if flag {
            if indexPath == myIndexPath {
                cell.accessoryType = .checkmark
            }
        } else {
            if indexPath == i {
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
                        index.set(indexPath.row, forKey: "index")
                        flag = true
                        myIndexPath = indexPath
                    }
                }
                continue
            }
            tableView.cellForRow(at: cellPath)!.accessoryType = .none
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
