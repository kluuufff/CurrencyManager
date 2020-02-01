//
//  CoreData.swift
//  CurrencyManager
//
//  Created by Надежда Возна on 22.01.2020.
//  Copyright © 2020 Надежда Возна. All rights reserved.
//

import UIKit
import CoreData

//MARK: - Global NSManagedObjects Arrays

var costs = [NSManagedObject]()
var myIndexPath: IndexPath!
var flag = false
var myIndexPath2: IndexPath!
var flag2 = false

//MARK: - Class CoreData

class CoreData {
    
    //MARK: - Func Save to CoreData
    
    func save(date: String, name: String, value: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Costs", in: context) else { return }
        let linkObject = NSManagedObject(entity: entity, insertInto: context)
        linkObject.setValue(date, forKey: "date")
        linkObject.setValue(name, forKey: "name")
        linkObject.setValue(value, forKey: "value")
        do {
            try context.save()
            costs.append(linkObject)
        } catch {
            print("Error")
        }
    }
    
    //MARK: - Func Fetch from CoreData
    
    func fetch() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "Costs")
        let sort = NSSortDescriptor(key: "date", ascending: false)
        fetch.sortDescriptors = [sort]
        do {
            costs = try context.fetch(fetch)
        } catch {
            print("Error")
        }
    }
    
    //MARK: - Func Delete from CoreData
    
    func delete(object: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        context.delete(costs[object])
        costs.remove(at: object)
        do {
            try context.save()
        } catch {
            print("error when delete")
        }
    }
}
