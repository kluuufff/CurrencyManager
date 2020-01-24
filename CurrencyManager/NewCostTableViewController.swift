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
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var countTextField: UITextField!
    
    private var data = [NSManagedObject]()
    private var amount = [NSManagedObject]()
    private var costs = [NSManagedObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneBarButtonAction(_ sender: UIBarButtonItem) {
        let coreData = CoreData()

        var finalName = ""
        if let name = nameTextField.text {
            finalName = name
        } else {
            print("nameTextField is empty")
        }
        var value = ""
        if let count = countTextField.text {
            value = count
        } else {
            print("countTextField is empty")
        }

        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, HH:mm"

        let dateResult = formatter.string(from: date)

        coreData.save(date: dateResult, name: finalName, value: value)
        coreData.fetch()
        
        performSegue(withIdentifier: "unwindToCostsTableViewController", sender: self)
    }
    
}
