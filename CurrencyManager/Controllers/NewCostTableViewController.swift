//
//  NewCostTableViewController.swift
//  CurrencyManager
//
//  Created by Надежда Возна on 22.01.2020.
//  Copyright © 2020 Надежда Возна. All rights reserved.
//

import UIKit
import CoreData

class NewCostTableViewController: UITableViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var countTextField: UITextField!
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameTextField.becomeFirstResponder()
    }
    
    //MARK: - doneBarButtonAction
    
    @IBAction func doneBarButtonAction(_ sender: UIBarButtonItem) {
        let coreData = CoreData()
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, HH:mm"
        let dateResult = formatter.string(from: date)
        var value = ""
        var finalName = ""
        var sum = UserDefaults.standard.integer(forKey: "amountSettings")
        
        if let name = nameTextField.text {
            finalName = name
        } else {
            print("nameTextField is empty")
        }
        if let count = countTextField.text {
            value = count
            let amount = Int(count)
            sum = sum - (amount ?? 0)
            UserDefaults.standard.set(sum, forKey: "balanceSettings")
        } else {
            print("countTextField is empty")
        }
        if finalName != "" || value != "" {
            #if DEBUG
            print("date = \(dateResult)")
            #endif
            coreData.save(date: dateResult, name: finalName, value: value)
            coreData.fetch()
            performSegue(withIdentifier: "unwindToCostsTableViewController", sender: self)
        } else {
            performSegue(withIdentifier: "unwindToCostsTableViewController", sender: self)
        }
    }
}
