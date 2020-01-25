//
//  AmountSettingsTableViewController.swift
//  CurrencyManager
//
//  Created by Надежда Возна on 25.01.2020.
//  Copyright © 2020 Надежда Возна. All rights reserved.
//

import UIKit

class AmountSettingsTableViewController: UITableViewController {

    @IBOutlet weak var amountTextField: UITextField!
    private var amount: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amount = UserDefaults.standard.integer(forKey: "amountSettings")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        amountTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.isMovingToParent {
            if amountTextField.text == "" && amount == 0 {
                amountTextField.text = "0"
                UserDefaults.standard.set(amountTextField.text, forKey: "amountSettings")
            }
            if amountTextField.text == "" && amount != 0 {
                amountTextField.text = String(amount)
                UserDefaults.standard.set(amountTextField.text, forKey: "amountSettings")
            } else {
                UserDefaults.standard.set(amountTextField.text, forKey: "amountSettings")
            }
        }
    }
}
