//
//  ThemesSettingsTableViewController.swift
//  CurrencyManager
//
//  Created by Надежда Возна on 26.01.2020.
//  Copyright © 2020 Надежда Возна. All rights reserved.
//

import UIKit

class ThemesSettingsTableViewController: UITableViewController {
    
    private let themesArray = ["System", "Dark", "Light"]
    private let themeSelect = UserDefaults.standard
    private var currentTheme = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "themeCell")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currentTheme = themesArray[themeSelect.integer(forKey: "themeSelect")]
        if self.isMovingToParent {
            themeSelect.set(currentTheme, forKey: "currentTheme")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return themesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "themeCell", for: indexPath)
        cell.textLabel?.text = themesArray[indexPath.row]
        let i = IndexPath(row: themeSelect.integer(forKey: "currentTheme"), section: 0)
        if flag2 {
            if indexPath == myIndexPath2 {
                cell.accessoryType = .checkmark
            }
        } else {
            if indexPath == i {
                cell.accessoryType = .checkmark
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
                        themeSelect.set(indexPath.row, forKey: "currentTheme")
                        flag2 = true
                        myIndexPath2 = indexPath
                    }
                }
                continue
            }
            tableView.cellForRow(at: cellPath)!.accessoryType = .none
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
