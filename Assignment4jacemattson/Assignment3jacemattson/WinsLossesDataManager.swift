//
//  WinsLossesDataManager.swift
//  Assignment3jacemattson
//
//  Created by Jace Mattson on 2019-03-18.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import Foundation


class WinsLossesDataManager {
    var winsLossesDict: [String: [String]]!
    var winsLosses: [String]!
    
    init() {
        if let url = Bundle.main.url(forResource: "WinsLosses", withExtension: "plist")
        {
            do
            {
                let winsLossesData = try Data(contentsOf: url)
                winsLossesDict = try PropertyListSerialization.propertyList(from: winsLossesData, options: [], format: nil) as! [String: [String]]
                winsLosses = Array(winsLossesDict.keys).sorted()
            }
            catch
            {
                print("Error reading rom plist file")
            }
        }
    }
    func wins(wins name:String) -> [String]
    {
        return winsLossesDict[name]!
    }
}
