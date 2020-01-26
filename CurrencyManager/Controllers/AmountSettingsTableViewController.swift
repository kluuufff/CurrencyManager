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
    private let settings = UserDefaults.standard
    private var amount: Int!
    private var amountOld = 0
    private var balanceOld = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amount = settings.integer(forKey: "amount")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        amountTextField.becomeFirstResponder()
        amountOld = settings.integer(forKey: "amount")
        balanceOld = settings.integer(forKey: "balance")
        print("amountOld \(amountOld)")
        print("balanceOld \(balanceOld)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.isMovingToParent {
            if amountTextField.text == "" && amount == 0 {
                amountTextField.text = "0"
                settings.set(amountTextField.text, forKey: "amount")
            }
            if amountTextField.text == "" && amount != 0 {
                amountTextField.text = String(amount)
                settings.set(amountTextField.text, forKey: "amount")
            } else {
                settings.set(amountTextField.text, forKey: "amount")
            }
            if let textFieldAmount = amountTextField.text {
                guard let intAmount = Int(textFieldAmount) else { return }
                if amountOld != 0 {
                    settings.set(intAmount - settings.integer(forKey: "sum"), forKey: "balance")
                }
            }
        }
    }
}
