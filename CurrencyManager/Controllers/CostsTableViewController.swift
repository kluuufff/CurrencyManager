//
//  CostsTableViewController.swift
//  CurrencyManager
//
//  Created by Надежда Возна on 21.01.2020.
//  Copyright © 2020 Надежда Возна. All rights reserved.
//

import UIKit
import CoreData

class CostsTableViewController: UITableViewController {
    
    private let settings = UserDefaults.standard
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let coreData = CoreData()
        coreData.fetch()
        tableView.register(UINib(nibName: "CostsTableViewCell", bundle: nil), forCellReuseIdentifier: "costsCell")
        tableView.register(UINib(nibName: "CustomCostsTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //MARK: - Done button in NewCostTableViewController
    
    @IBAction func unwindToCostsTableViewController(segue: UIStoryboardSegue) {
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

//MARK: - TableView extension

extension CostsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //return count cows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return costs.count
        } else {
            return 1
        }
    }
    
    //return cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        if section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomCostsTableViewCell
            cell.lastPaymentLabel.text = (settings.string(forKey: "currSymbol") ?? "$") + String((costs.last?.value(forKey: "value") as? String) ?? "0")
//            var todayCosts = 0
//            var weeklyCosts = 0
//            todayCosts = settings.integer(forKey: "amount") - settings.integer(forKey: "sum")
//            weeklyCosts = settings.integer(forKey: "amount") - settings.integer(forKey: "sum")
            cell.typePaymentLabel.text = settings.string(forKey: "amountType")
            cell.availableLabel.text = (settings.string(forKey: "currSymbol") ?? "$") + (settings.string(forKey: "balance") ?? settings.string(forKey: "amount") ?? "0")
            cell.todayCostsLabel.text = (settings.string(forKey: "currSymbol") ?? "$") + (settings.string(forKey: "sum") ?? "0")
            cell.weeklyCostsLabel.text = (settings.string(forKey: "currSymbol") ?? "$") + (settings.string(forKey: "sum") ?? "0")
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "costsCell") as! CostsTableViewCell
            cell.dateLabel.text = costs[indexPath.row].value(forKey: "date") as? String
            cell.amountLabel.text = costs[indexPath.row].value(forKey: "name") as? String
            cell.costsTypeLabel.text = "-" + (settings.string(forKey: "currSymbol") ?? "$") + String((costs[indexPath.row].value(forKey: "value") as? String) ?? "0")
            return cell
        }
    }
    
    //return row height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        if section == 0 {
            return 192
        } else if section == 1 {
            return 120
        }
        return 0
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let coreData = CoreData()
            let oldBalance = settings.integer(forKey: "balance")
            let sum = settings.integer(forKey: "sum")
            let returnAmount = costs[indexPath.row].value(forKey: "value") as? String
            coreData.delete(object: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            settings.set(oldBalance + Int(returnAmount!)!, forKey: "balance")
            settings.set(sum - Int(returnAmount!)!, forKey: "sum")
        }
    }
}
