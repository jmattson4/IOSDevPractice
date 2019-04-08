//
//  MobilePhoneDataManager.swift
//  MutliSectionTableViewDemo
//
//  Created by Jace Mattson on 2019-03-11.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import Foundation

class MobilePhoneDataManager
{
    var mobilePhoneDict: [String: [String]]!
    var manufacturers: [String]!
    
    init()
    {
        if let url = Bundle.main.url(forResource: "mobile-phones", withExtension: "plist")
        {
            do
            {
                let mobilePhoneData = try Data(contentsOf: url)
                mobilePhoneDict = try PropertyListSerialization.propertyList(from: mobilePhoneData, options: [], format: nil) as! [String: [String]]
                manufacturers = Array(mobilePhoneDict.keys).sorted()
            }
            catch
            {
                print("Error reading from plist file")
            }
        }
    }
    func manufacturerPhones(manufacturerName name:String) -> [String]
    {
        return mobilePhoneDict[name]!
    }

}

