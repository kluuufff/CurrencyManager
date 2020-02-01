//
//  Costs2TableViewController.swift
//  CurrencyManager
//
//  Created by Надежда Возна on 31.01.2020.
//  Copyright © 2020 Надежда Возна. All rights reserved.
//

import UIKit

class CostsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let settings = UserDefaults.standard

    @IBOutlet weak var tableViewStatistic: UITableView!
    @IBOutlet weak var tableViewData: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let coreData = CoreData()
        coreData.fetch()
        tableViewStatistic.register(CostsTableViewCell.self, forCellReuseIdentifier: "costsCell")
        tableViewData.register(CustomCostsTableViewCell.self, forCellReuseIdentifier: "customCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableViewStatistic.reloadData()
        tableViewData.reloadData()
    }
    
    @IBAction func unwindToCostsViewController(segue: UIStoryboardSegue) {
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.tableViewStatistic.reloadData()
                self.tableViewData.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewStatistic {
            return 1
        }
        if tableView == tableViewData {
            return costs.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tableViewStatistic {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCostsTableViewCell
            cell.lastPaymentLabel.text = (settings.string(forKey: "currSymbol") ?? "$") + String((costs.last?.value(forKey: "value") as? String) ?? "0")
            cell.typePaymentLabel.text = settings.string(forKey: "amountType")
            cell.availableLabel.text = (settings.string(forKey: "currSymbol") ?? "$") + (settings.string(forKey: "balance") ?? settings.string(forKey: "amount") ?? "0")
            cell.todayCostsLabel.text = (settings.string(forKey: "currSymbol") ?? "$") + (settings.string(forKey: "sum") ?? "0")
            cell.weeklyCostsLabel.text = (settings.string(forKey: "currSymbol") ?? "$") + (settings.string(forKey: "sum") ?? "0")
            return cell
        }
        if tableView == tableViewData {
            let cell = tableView.dequeueReusableCell(withIdentifier: "costsCell", for: indexPath) as! CostsTableViewCell
            cell.dateLabel.text = costs[indexPath.row].value(forKey: "date") as? String
            cell.amountLabel.text = costs[indexPath.row].value(forKey: "name") as? String
            cell.costsTypeLabel.text = "-" + (settings.string(forKey: "currSymbol") ?? "$") + String((costs[indexPath.row].value(forKey: "value") as? String) ?? "0")
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == tableViewStatistic {
            return 172
        }
        if tableView == tableViewData {
            return 76
        }
        return 0
    }

        // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
