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
    
    //MARK: - doneBarButtonAction
    
    @IBAction func doneBarButtonAction(_ sender: UIBarButtonItem) {
        let coreData = CoreData()
        let date = Date()
        let formatter = DateFormatter()
        let dateResult = formatter.string(from: date)
        var value = ""
        var finalName = ""
        
        if let name = nameTextField.text {
            finalName = name
        } else {
            print("nameTextField is empty")
        }
        if let count = countTextField.text {
            value = count
        } else {
            print("countTextField is empty")
        }
        formatter.dateFormat = "EEEE, HH:mm"
        coreData.save(date: dateResult, name: finalName, value: value)
        coreData.fetch()
        performSegue(withIdentifier: "unwindToCostsTableViewController", sender: self)
    }
}
