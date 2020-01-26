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
    
    //return count cows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return costs.count
    }
    
    //return cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "costsCell", for: indexPath) as! CostsTableViewCell
        cell.dateLabel.text = costs[indexPath.row].value(forKey: "date") as? String
        cell.amountLabel.text = costs[indexPath.row].value(forKey: "name") as? String
        cell.costsTypeLabel.text = "-" + (settings.string(forKey: "currSymbol") ?? "$") + String((costs[indexPath.row].value(forKey: "value") as? String)!)
        cell.accessoryView?.frame = CGRect(x: 5, y: 5, width: 5, height: 5)
        return cell
    }
    
    //return row height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
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
