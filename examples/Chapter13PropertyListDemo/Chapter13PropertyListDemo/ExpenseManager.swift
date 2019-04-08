//
//  ExpenseManager.swift
//  Chapter13PropertyListDemo
//
//  Created by Jace Mattson on 2019-04-01.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import Foundation
class ExpenseManager{
    var expenses = [Expense]()
    
    let expenseURL: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls.first!.appendingPathComponent("ExpensesPropertyList.plist")
    }()
    
    func retrieveExpenses(){
        expenses.removeAll()
        guard let plistItems = NSArray(contentsOf: expenseURL)
            else{return}
        
        guard let itemsDict = plistItems as? [[String: AnyObject]]
            else{return}
        
        for singleItemDict in itemsDict{
            let singleExpense = Expense()
            singleExpense.expenseDescription = singleItemDict["expensedescription"] as! String
            singleExpense.amount = singleItemDict["amount"] as! Double
            singleExpense.date = singleItemDict["date"] as! Date
            singleExpense.expenseID = singleItemDict["expenseid"] as! Int
            expenses.append(singleExpense)
        }
    }
    
    func writeToFile(){
        var plistArray = [[String: AnyObject]]()
        for singleExpense in expenses{
            var singleExpenseDict = [String: AnyObject]()
            singleExpenseDict["expenseid"] = singleExpense.expenseID as AnyObject
            singleExpenseDict["expensedescription"] = singleExpense.expenseDescription as AnyObject
            singleExpenseDict["amount"] = singleExpense.amount as AnyObject
            singleExpenseDict["date"] = singleExpense.date as AnyObject
            plistArray.append(singleExpenseDict)
        }
        let array = plistArray as NSArray
        if array.write(to: expenseURL, atomically: true){
            print("Write to file successful")
        }
        else{
            print("Write to file unsuccessful")
        }
    }
    func addExpense(_ newExpense: Expense)
    {
        newExpense.expenseID = expenses.count + 1
        expenses.append(newExpense)
        writeToFile()
    }
    init(){
        let expenseSandboxPath = expenseURL.path
        if !FileManager.default.fileExists(atPath: expenseSandboxPath){
            guard let expenseBundlePath = Bundle.main.path(forResource: "ExpensesPropertyList", ofType: "plist")
                else{return}
            do {
                try FileManager.default.copyItem(atPath: expenseBundlePath, toPath: expenseSandboxPath)
                print("File copy was successful")
            } catch {
                print("Error copy files: \(error)")
            }
        }
    }
}
