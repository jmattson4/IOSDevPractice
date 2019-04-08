//
//  SearchResultsTableViewController.swift
//  ChapterNineDemo01
//
//  Created by Jace Mattson on 2019-03-13.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController, UISearchResultsUpdating {
    let sectionsTableIdentifier = "SectionsTableIdentifer"
    var names: [String: [String]] = [String: [String]]()
    var keys = [String] = []
    var filteredNames = [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
