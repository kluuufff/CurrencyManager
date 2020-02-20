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
//            let curr = themeSelect.string(forKey: "currentTheme")
//            print("currTheme: \(curr)")
//            if themeSelect.string(forKey: "currentTheme") == "Dark" {
//                self.view.window?.overrideUserInterfaceStyle = .dark
//            } else if themeSelect.string(forKey: "currentTheme") == "Light" {
//                self.view.window?.overrideUserInterfaceStyle = .light
//            } else {
//                self.view.window?.overrideUserInterfaceStyle = .unspecified
//            }
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
            } else {
                cell.accessoryType = .none
            }
        } else {
            if indexPath == i {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
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
                        themeSelect.set(indexPath.row, forKey: "themeSelect")
                        flag2 = true
                        myIndexPath2 = indexPath
                        currentTheme = themesArray[self.themeSelect.integer(forKey: "themeSelect")]
                        print("currentTheme \(currentTheme)")
                        if self.themesArray[self.themeSelect.integer(forKey: "themeSelect")] == "Dark" {
                            self.view.window?.overrideUserInterfaceStyle = .dark
                        } else if self.themesArray[self.themeSelect.integer(forKey: "themeSelect")] == "Light" {
                            self.view.window?.overrideUserInterfaceStyle = .light
                        } else {
                            self.view.window?.overrideUserInterfaceStyle = .unspecified
                        }
                    }
                }
                continue
            }
            tableView.cellForRow(at: cellPath)!.accessoryType = .none
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
}
