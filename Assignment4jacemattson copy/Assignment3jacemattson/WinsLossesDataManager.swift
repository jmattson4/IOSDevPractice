//
//  WinsLossesDataManager.swift
//  Assignment3jacemattson
//
//  Created by Jace Mattson on 2019-03-18.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import Foundation


class WinsLossesDataManager {
    var winsLossesAverages = [WinLossAverage]()
    let winsLossesURL: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls.first!.appendingPathComponent("WinsLosses.plist")
    }()
    func retrieveWinsLosses(){
        winsLossesAverages.removeAll()
        guard let plistItems = NSArray(contentsOf: winsLossesURL)
            else{return}
        guard let itemsDict = plistItems as? [[String: AnyObject]]
            else{return}
        for singleItemDict in itemsDict{
            let singleWinsLossesAverage = WinLossAverage()
            singleWinsLossesAverage.win = singleItemDict["Wins"] as! Int
            singleWinsLossesAverage.loss = singleItemDict["Losses"] as! Int
            singleWinsLossesAverage.average = singleItemDict["Average"] as! Double
            winsLossesAverages.append(singleWinsLossesAverage)
        }
    }
    func writeToFile(){
        var plistArray = [[String: AnyObject]]()
        for singleWinsLossesAverage in winsLossesAverages{
            var singleWinsLossesDict = [String: AnyObject]()
            singleWinsLossesDict["Wins"] = singleWinsLossesAverage.win as AnyObject
            singleWinsLossesDict["Losses"] = singleWinsLossesAverage.loss as AnyObject
            singleWinsLossesDict["Average"] = singleWinsLossesAverage.win / singleWinsLossesAverage.loss as AnyObject
            plistArray.append(singleWinsLossesDict)
        }
        let array = plistArray as NSArray
        if array.write(to: winsLossesURL, atomically: true){
            print("Write to file succesful")
        }
        else{
            print("Write to file unsuccesful")
        }
    }
    init(){
        let winsLossesSandboxPath = winsLossesURL.path
        if !FileManager.default.fileExists(atPath: winsLossesSandboxPath){
            guard let winsLossesBundlePath = Bundle.main.path(forResource: "WinsLosses", ofType: "plist")
                else{return}
            do{
                try FileManager.default.copyItem(atPath: winsLossesBundlePath, toPath: winsLossesSandboxPath)
                print("File Copy was succesful")
            } catch{
                print("Error copy files: \(error)")
            }
        }
    }
}
