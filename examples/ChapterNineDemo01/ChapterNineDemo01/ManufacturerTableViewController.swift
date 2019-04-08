//
//  ManufacturerTableViewController.swift
//  ChapterNineDemo01
//
//  Created by Jace Mattson on 2019-03-11.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import UIKit

class ManufacturerTableViewController: UITableViewController {

    let dataManager = MobilePhoneDataManager()


    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let manufacturer = dataManager.manufacturers[section]
        return dataManager.manufacturerPhones(manufacturerName: manufacturer)
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "manufacturerCell", for: indexPath)

        // Configure the cell...
        let manufacturer = dataManager.manufacturers[indexPath.row]
        cell.textLabel?.text = manufacturer
        
        return cell
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destinationViewController.
        let manufacturerPhone = segue.destination as! ManufacturerPhonesTableViewController
         // Pass the selected object to the new view controller.
        let selectedRow = tableView.indexPathForSelectedRow?.row
        manufacturerPhone.manufacturerName = dataManager.manufacturers[selectedRow!]
        
    }

}
