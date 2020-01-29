//
//  CurrencyTypeTableViewController.swift
//  CurrencyManager
//
//  Created by Надежда Возна on 25.01.2020.
//  Copyright © 2020 Надежда Возна. All rights reserved.
//

import UIKit

class CurrencyTypeTableViewController: UITableViewController {
    
    private var currencyDictionary = [String: [String]]()
    private var symbolDictionary = [String: [String]]()
    private var currencySectionTitles = [String]()
    private var currentCurrency = ""
    private let settings = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        currencySort()
    }
    
    func setupNavBar() {
//        let searchBar = UISearchController(searchResultsController: nil)
//        searchBar.searchResultsUpdater = self
//        navigationItem.searchController = searchBar
//        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func currencySort() {
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
        currentCurrency = currencyArray[settings.integer(forKey: "index")].symbol
        if self.isMovingToParent {
            settings.set(currentCurrency, forKey: "currSymbol")
            #if DEBUG
            print("currentCurrency: \(currentCurrency)")
            #endif
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
        if flag {
            if indexPath == myIndexPath {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        } else {
            if indexPath == IndexPath(row: 0, section: 20) {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
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
                        settings.set(indexPath.row, forKey: "index")
                        flag = true
                        myIndexPath = indexPath
                        settings.set(indexPath.section, forKey: "section")
                    }
                }
                continue
            }
            tableView.cellForRow(at: cellPath)?.accessoryType = .none
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

//extension CurrencyTypeTableViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        let currKey = currencySectionTitles[indexPath.section]
//        if let searchText = searchController.searchBar.text {
//            if let currValues = currencyDictionary[currKey] {
//                searchResult = filteredCurrency.filter({$0.lowercased().contains(searchText)})
//    //            searchFlag = true
//            }
//        }
//        tableView.reloadData()
//
//    }
//}
