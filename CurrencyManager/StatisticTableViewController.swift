//
//  StatisticTableViewController.swift
//  CurrencyManager
//
//  Created by Надежда Возна on 21.01.2020.
//  Copyright © 2020 Надежда Возна. All rights reserved.
//

import UIKit

class StatisticTableViewController: UITableViewController {
    
    @IBOutlet weak var limitView: UIView! {
        didSet {
            limitView.layer.cornerRadius = 10
            limitView.layer.shadowOpacity = 0.25
            limitView.layer.shadowRadius = 8
            limitView.layer.shadowColor = UIColor.gray.cgColor
            limitView.layer.shadowOffset = CGSize.zero
        }
    }
    
    @IBOutlet weak var balanceView: UIView! {
        didSet {
            balanceView.layer.cornerRadius = 10
            balanceView.layer.shadowOpacity = 0.25
            balanceView.layer.shadowRadius = 8
            balanceView.layer.shadowColor = UIColor.gray.cgColor
            balanceView.layer.shadowOffset = CGSize.zero
        }
    }
    
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        changeButton.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
//        moreButton.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "limitCell")
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "balanceCell")
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "chartCell")
        changeButton.tag = 0
    }
//
//    @objc func connected(sender: UIButton){
//        let buttonTag = sender.tag
//    }

    @IBAction func changeButtonAction(_ sender: UIButton) {
//        let indexPath = IndexPath(row: 0, section: 0)
//        changeButton.tag = indexPath.row
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "limitCell", for: indexPath)
//            return cell
//        }
//        else if indexPath.row == 1 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "balanceCell", for: indexPath)
//            return cell
//        }
//        else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "chartCell", for: indexPath)
//            return cell
//        }
//        let cell2 = tableView.dequeueReusableCell(withIdentifier: "balanceCell", for: indexPath)

         changeButton.tag = indexPath.row
         moreButton.tag = indexPath.row
//         button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        return UITableViewCell()
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
