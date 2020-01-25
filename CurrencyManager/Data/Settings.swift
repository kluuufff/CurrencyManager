//
//  Settings.swift
//  CurrencyManager
//
//  Created by Надежда Возна on 25.01.2020.
//  Copyright © 2020 Надежда Возна. All rights reserved.
//

import UIKit
import CoreData

var settings = [NSManagedObject]()

class SettingsCRUD {
    
    //MARK: - Func Save to CoreData
    
    func save(date: String, name: String, value: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Settings", in: context) else { return }
        let linkObject = NSManagedObject(entity: entity, insertInto: context)
        linkObject.setValue(date, forKey: "currency")
        linkObject.setValue(name, forKey: "curr_type")
        do {
            try context.save()
            settings.append(linkObject)
        } catch {
            print("Error with save data")
        }
    }
    
    //MARK: - Func Fetch from CoreData
    
    func fetch() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "Settings")
        do {
            settings = try context.fetch(fetch)
        } catch {
            print("Error with fetch data")
        }
    }
    
    //MARK: - Func Delete from CoreData
    
    func delete(object: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        context.delete(costs[object])
        settings.remove(at: object)
        do {
            try context.save()
        } catch {
            print("Error with delete data")
        }
    }
}

