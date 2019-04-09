//
//  FirstViewController.swift
//  BridgeControl
//
//  Created by Jace Mattson on 2019-04-08.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController{
    
    let officerKey = Constants.init().officerkey
    let authorizationKey = Constants.init().authorizationCodeKey
    let rankKey = Constants.init().ranKey
    let warpDriveKey = Constants.init().warpDriveKey
    let warpFactorKey = Constants.init().warpFactorKey
    @IBOutlet weak var officerLabel: UILabel!
    @IBOutlet weak var authorizationCodeLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var warpDrive: UILabel!
    @IBOutlet weak var warpFactor: UILabel!
    @IBOutlet weak var favoriteTea: UILabel!
    @IBOutlet weak var favoriteCaptain: UILabel!
    @IBOutlet weak var favoriteGadget: UILabel!
    @IBOutlet weak var favoriteAlien: UILabel!
    func refreshFields(){
        let defaults = UserDefaults.standard
        officerLabel.text = defaults.string(forKey:officerKey)
        authorizationCodeLabel.text = defaults.string(forKey: authorizationKey)
        rankLabel.text = defaults.string(forKey: rankKey)
        warpDrive.text = defaults.bool(forKey: warpDriveKey) ? "Engaged" : "Disabled"
        warpFactor.text = defaults.object(forKey: warpFactorKey) as? String
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        refreshFields()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
