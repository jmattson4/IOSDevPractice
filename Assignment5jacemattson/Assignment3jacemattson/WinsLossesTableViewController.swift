//
//  WinsLossesTableViewController.swift
//  Assignment3jacemattson
//
//  Created by Jace Mattson on 2019-03-18.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import UIKit

class WinsLossesTableViewController: UITableViewController {
    let dataManager = WinsLossesDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        dataManager.retrieveWinsLosses()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        self.loadData()
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func loadData(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        dataManager.retrieveWinsLosses()
        loadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "winsCell", for: indexPath) as! WinsLossesTableViewCell

        // Configure the cell...
        let winsLossesAverage = dataManager.winsLossesAverages[indexPath.section]
        if indexPath.row == 0 {
            cell.wins.text = String(winsLossesAverage.win)
            cell.losses.text = String(winsLossesAverage.loss)
            cell.average.text = String(winsLossesAverage.average)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Wins Losses And Average"
}
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        let wins = dataManager.winsLosses[section]
        return wins
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

 }
